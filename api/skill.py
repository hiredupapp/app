from flask_restful import Resource, reqparse
import app_constants as CN
from data.data_access import AppData
import sys


class Skill(Resource):
	"""Skill that a user may possess."""

	parser = reqparse.RequestParser()
	parser.add_argument(CN.GEN_SEARCH)
	parser.add_argument(CN.PM_SKILL_CATEGORY)

	def __init__(self):
		self.data = AppData()

	def get(self, skill_id=0):
		"""Accepts skill id 
			q search will return all string matches (0-many).
			Partial skill fragments will return all matches (e.g. /Skills?q=sql will return MySQL, T-SQL, PL-SQL, etc.) 
			
			Future: when proficieny customized for each skill, this result
			should return proficiency dictionary for each skill.
		"""
		try:
			args = Skill.parser.parse_args()
			args[CN.PM_SKILL_ID] = skill_id
			args[CN.PM_SKILL] = args.pop(CN.GEN_SEARCH)
			return self.data.call(CN.GET_SKILLS, args)
		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise

	def put(self, resource_id, skill_id, proficiency_id, duration_id):
		""" Add skill-proficiency combo to a resource profile. """
		try:
			self.process_skill_proficiencies(resource_id, skill_id, proficiency_id, CN.PUT_SKILLS, duration_id)
			return CN.DF_SUCCESS

		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise

	def delete(self, resource_id, skill_id, proficiency_id):
		""" Remove skill-proficiency combo from a resource profile. """
		try:
			self.process_skill_proficiencies(resource_id, skill_id, proficiency_id, CN.DEL_SKILLS)
			return CN.DF_SUCCESS

		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise

	def process_skill_proficiencies(self, resource_id, skill_id, proficiency_id, action, duration_id=0):
		"""Generic method for managing skill-proficiencies """
		try:
			args = Skill.parser.parse_args()
			args[CN.PM_RESOURCE_ID] = resource_id
			args[CN.PM_SKILL_ID] = skill_id
			args[CN.PM_PROFICIENCY_ID] = proficiency_id
			if duration_id != 0:
				args[CN.PM_DURATION_ID] = duration_id
			return self.data.call(action, args)

		except:
			print (CN.EX_GENERIC, sys.exc_info()[0])
			raise
