REM The directory to curl.exe is either in the system path or 
REM this .bat file runs from the same directory as curl

set server=localhost:5000

curl "http://%server%/Members" -X GET
curl "http://%server%/Members/80" -X GET
curl "http://%server%/Members?fName=Jason&lName=Richardson&usr=jrichardson11111121@gmail.com&pwd=HiredUp4Life&locId=12228&empStatId=5&curSalId=6&desSalId=13" -X PUT
curl "http://%server%/auth/Login?email=jrichardson1@gmail.com&pwd=HiredUp4Life" -X GET
curl "http://%server%/auth/Login?email=jrichardson1@gmail.com&pwd=IMDifferent!" -X POST
curl http://%server%/Locations/4819


curl "http://%server%/Skills"
curl "http://%server%/Skills/77"
curl "http://%server%/Skills?skillCat=soft%20skills"
curl "http://%server%/Skills?q=sql"
curl http://%server%/Proficiencies

curl "http://%server%/MemberSkills/80" -X GET
curl "http://%server%/Members/77/Skill/75/Proficiency/75/Duration/75" -X PUT
curl "http://%server%/Members/77/Skill/75/Proficiency/75" -X DELETE