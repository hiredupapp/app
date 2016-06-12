"""Application constants """

""" REST parameters 
 PM_ = parameter
 R_ = resource
 M_ = member
 HM = hiring manager

"""
PM_RES_USER = "usr"
PM_RES_FIRST_NAME = "fName"
PM_RES_LAST_NAME = "lName"
PM_RES_PASSWORD = "pwd"
PM_RES_LOCATION_ID = "locId"
PM_LOC_ZIP = "zip"
PM_SKILL = "skill"
PM_RESOURCE_ID = "resId"
PM_SKILL_ID = "skId"
PM_PROFICIENCY_ID = "profId"
PM_SKILL_CATEGORY = "skillCat"
PM_DURATION_ID = "durId"
PM_MEM_EMPLOY_STATUS_ID = "empStatId"
PM_MEM_CURRENT_SALARY_ID = "curSalId"
PM_MEM_DESIRED_SALARY_ID = "desSalId"

# Data calls
PUT_RESOURCE = 'insResource'
PUT_MEMBER = 'insMember'
GET_RESOURCE = 'getResources'
GET_MEMBERS = 'getMembers'
GET_LOCATION = 'getLocations'
GET_SKILLS = 'getSkills'
GET_PROFICIENCIES = 'getProficiencies'
PUT_SKILLS = 'insResourceSkillsProficiencies'
DEL_SKILLS = 'delResourceSkillsProficiencies'
GET_CREDENTIALS = "getResourceCredentials"
POST_CREDENTIALS = "updResourceCredentials"
GET_RESOURCE_SKILLS = "getResourceSkills"

# General
GEN_SEARCH = "q"


# Default values
DF_STATUS = "status"
DF_SUCCESS = "success"

# User Outputs

EX_GENERIC = "An unexpected error occurred.  Please try again."

SUCCESS = dict()
SUCCESS[DF_STATUS] = DF_SUCCESS