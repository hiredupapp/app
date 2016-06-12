from flask_restful import Resource, reqparse
import app_constants as CN
from data.data_access import AppData
import sys


class Proficiency(Resource):
	"""Proficiency that a user may possess."""

	def __init__(self):
		self.data = AppData()

	def get(self, name='0'):
		"""Returns basic list of proficiencies
			
			Future: when proficieny customized for each skill, this result should be merged with Skill class
		"""
		try:
			return self.data.call(CN.GET_PROFICIENCIES)
		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise