from flask_restful import Resource, reqparse
import app_constants as CN
from data.data_access import AppData
import sys


class Location(Resource):
	"""Geographic location."""

	def __init__(self):
		self.data = AppData()
		
	def get(self, zip='0'):
		"""Accepts zip and returns associated cities (0-many).
			Partial zip prefixes will return all matches (e.g. /Locations/48 will return all 48xxx) 
			There is no mechanism for returning all zip codes.
		"""
		try:
			args = dict()
			args[CN.PM_LOC_ZIP] = zip
			return self.data.call(CN.GET_LOCATION, args)
		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise