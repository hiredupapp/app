from data.config import conStr
import data.data_constants as DC
import pymysql, sys

class AppData():
	"""Connection and data management to underlying relational data structures.
	Class and methods generically named interntionally in preparation for migration
	away from MySQL to a more scalable noSQL solution.
	"""

	def __init__(self):
		self.conn = None
		self.curs = None
		self.outParms = dict()

	def call(self, method, args=None):
		"""Parameters: 
				method - name of the stored procedure
				args - dictionary of parameters to pass to stored procedure
			Return: 
				list of dictionaries of either Get resultset or PUT/POST output parameters
		"""
		try:
			self.establish_connection()
			parms = []
			# Only loop args if there are parameters in the dictionary
			if args:
				parms = self.get_proc_parameters(method, args)		    
			self.curs.callproc(method, parms)
			
			# if any records were returned from the original SP call, then return it, else return Output parms
			result = self.curs.fetchall()
			if not result:
				result = self.get_output_paramters(method)

			self.conn.commit()
			return result

		except:
			print (DC.EX_GENERIC, sys.exc_info()[0])
			self.conn.rollback()
			raise

		finally:
			self.close_connection()

	def establish_connection(self):
		"""Connect to the database"""
		try:
			#TODO: move this to config.py
			self.conn = pymysql.connect(host='localhost', user='root', password='password', db='hiredup$HiredUp')
			#By default, cursor returns tuples from query calls.  Initializing as dict() returns field names too
			self.curs = self.conn.cursor(pymysql.cursors.DictCursor)
		except:
			print (DC.EX_GENERIC, sys.exc_info()[0])
			raise

	def close_connection(self):
		try:
			self.curs.close()
			self.conn.close()			
		except:
			print (DC.EX_GENERIC, sys.exc_info()[0])
			raise

	def get_proc_parameters(self, method, args):
		"""PyMySQL does not accept named parameters
		So retrieve the ordered list of parameters for the proc from MySQL and build the ordered
		parameter list from the REST call before calling the SP 
		There is overhead to doing this, but sacrificing it for DB abstraction.
		Assumption: a DB connection has already been established in the caller
		"""

		try:
			self.curs.callproc(DC.SP_GET_PROC_PARMS, (method, ))
			result = self.curs.fetchall() 
			parameters = [] #ordered parameter listing built from args values

			#loop SP parameter listing (list of dictionaries) to pair the parameters with the args
			for index, value in enumerate(result):		    
				if value[DC.FLD_PARM_MODE] == "IN":
					parameters.append(args[value[DC.FLD_PARM_NAME]])		    		
				else:
					# dictionary of out parameters to be retrieved after SP call completes
					parameters.append(DC.DF_SP_OUTPUT_PARM)
					self.outParms[value[DC.FLD_PARM_NAME]] = index
			return parameters

		except:
			print (DC.EX_GENERIC, sys.exc_info()[0])
			raise

	def get_output_paramters(self, method):
		""" This is a terrible way of having to get output parameters from an SP... 
		They could peppered in the parm list and the python syntax for retrieving them is awful.
		Loop the outParms dictionary with the positional placement of all output parms from the get_proc_parameters call.
		Dynamically build the SELECT statement to retrieve those values."""
		try:
			if self.outParms:
				parmStr = ""
				for key, value in self.outParms.items():
					if parmStr != "":
						parmStr = ","
					else:
						parmStr = "@_" + method + "_" + str(value) + " as " + key

				self.curs.execute("SELECT " + parmStr)
				return self.curs.fetchall()

		except:
			print (DC.EX_GENERIC, sys.exc_info()[0])
			raise
		
