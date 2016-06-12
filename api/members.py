from flask_restful import Resource, reqparse
import app_constants as CN
from data.data_access import AppData
from auth.login import Login
import sys


class Members(Resource):
	"""Highest level object for all users."""

	parser = reqparse.RequestParser()
	parser.add_argument(CN.PM_RES_USER)
	parser.add_argument(CN.PM_RES_LAST_NAME)
	parser.add_argument(CN.PM_RES_FIRST_NAME)
	parser.add_argument(CN.PM_RES_PASSWORD)	
	parser.add_argument(CN.PM_RES_LOCATION_ID)	
	parser.add_argument(CN.PM_MEM_EMPLOY_STATUS_ID)	
	parser.add_argument(CN.PM_MEM_CURRENT_SALARY_ID)	
	parser.add_argument(CN.PM_MEM_DESIRED_SALARY_ID)	

	def __init__(self):
		self.data = AppData()
		
	def get(self, resource_id='0'):
		"""Accepts resourceId and returns Resource profile in JSON.

			Future: embed resource URL with every response (e.g. "url": "/Members/123")
				promotes discoverability of API URLs
		"""
		try:
			args = dict()
			#if parm is a number, then rId, else email
			if resource_id.isdigit():
				args[CN.PM_RESOURCE_ID] = resource_id
				args[CN.PM_RES_USER] = 0
			else:
				args[CN.PM_RESOURCE_ID] = 0
				args[CN.PM_RES_USER] = resource_id
			return self.data.call(CN.GET_MEMBERS, args)
		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise

	def put(self):
		"""Adds new user to the system and returns Resource profile, including system generator resourceId, as dictionary."""
		try:
			member_args = dict()
			args = Members.parser.parse_args()
			args[CN.PM_RESOURCE_ID] = 0

			#build the member dictionary for the independent insert
			member_args[CN.PM_MEM_EMPLOY_STATUS_ID] = args.pop(CN.PM_MEM_EMPLOY_STATUS_ID)
			member_args[CN.PM_MEM_CURRENT_SALARY_ID] = args.pop(CN.PM_MEM_CURRENT_SALARY_ID)
			member_args[CN.PM_MEM_DESIRED_SALARY_ID] = args.pop(CN.PM_MEM_DESIRED_SALARY_ID)
			
			password = ""

			#If password is present, strip it out and manage it with the login module
			if args[CN.PM_RES_PASSWORD]:
				password = args[CN.PM_RES_PASSWORD]
				args.pop(CN.PM_RES_PASSWORD)
			
			##########################
			# TODO: wrap this in a TRANSACTION block to rollback resource insert if member insert fails						
			##########################
			result = self.data.call(CN.PUT_RESOURCE, args)

			member_args[CN.PM_RESOURCE_ID] = result[0][CN.PM_RESOURCE_ID]
			self.data.call(CN.PUT_MEMBER, member_args)
			# TODO: initialize token for user session
			if password != "":
				l = Login()
				l.update_password(args[CN.PM_RES_USER], password)
				
			return result

		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise