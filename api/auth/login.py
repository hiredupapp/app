from flask_restful import Resource, reqparse
import app_constants as CN
from data.data_access import AppData
from passlib.hash import pbkdf2_sha256
import sys

class Login(Resource):
	"""Authenticate users."""

	parser = reqparse.RequestParser()
	parser.add_argument(CN.PM_RES_USER)
	parser.add_argument(CN.PM_RES_PASSWORD)

	def __init__(self):
		self.data = AppData()

	def get(self):
		"""Boolean return of whether provided password matches what's stored on file """
		try:
			args = Login.parser.parse_args()
			#if the parameter is null, exit
			if not args[CN.PM_RES_USER]:
				return False
			else:
				parms = dict()
				parms[CN.PM_RES_USER] = args[CN.PM_RES_USER]
				result = self.data.call(CN.GET_CREDENTIALS, parms)
				#if no password is on file, exit
				if result is None:
					return False
				else:
					return pbkdf2_sha256.verify(args[CN.PM_RES_PASSWORD], result[0][CN.PM_RES_PASSWORD])

		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise

	def post(self):
		"""Update user password """
		try:
			args = Login.parser.parse_args()
			self.update_password(args[CN.PM_RES_USER], args[CN.PM_RES_PASSWORD])			
			return CN.SUCCESS
		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise

	def update_password(self, usr, password):
		"""Hash the password and write it to the database """
		try:
			#TODO -> if valid token :

			#Replace the URL parm password with the newly hashed version
			args = dict()
			args[CN.PM_RES_USER] = usr
			args[CN.PM_RES_PASSWORD] = pbkdf2_sha256.encrypt(password)
			self.data.call(CN.POST_CREDENTIALS, args)
			return CN.SUCCESS
		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise		