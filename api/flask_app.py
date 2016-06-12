from flask import Flask, request
from flask_restful import Resource, Api
import sys
from members import Members
from location import Location
from skill import Skill
from memberSkill import MemberSkill
from proficiency import Proficiency
from auth.login import Login

app = Flask(__name__)
api = Api(app)

""" .parser.parse_args() is deprecated. Marshmallow appears to be the suggested method going forward
	http://flask-restful-cn.readthedocs.io/en/0.3.5/reqparse.html 

"""

# URL parameters must match the names of the stored procedure parameters

api.add_resource(Members, '/Members','/Members/<resource_id>')
api.add_resource(Login, '/auth/Login')
api.add_resource(Location, '/Locations/<zip>')
# TODO: move the last 2 URLs to a new class - ResourceSkills
api.add_resource(Skill, '/Skills', '/Skills/<skill_id>')
api.add_resource(MemberSkill, '/MemberSkills/<int:resource_id>',
	'/Members/<int:resource_id>/Skill/<int:skill_id>/Proficiency/<int:proficiency_id>/Duration/<int:duration_id>', 
	'/Members/<int:resource_id>/Skill/<int:skill_id>/Proficiency/<int:proficiency_id>')
api.add_resource(Proficiency, '/Proficiencies')

if __name__ == '__main__':
	app.run(debug=True)