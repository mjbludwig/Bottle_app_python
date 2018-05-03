from bottle import *
import os
import re

app = Bottle()

@app.route('/')
def mainPage():
    return template('mainPage.tpl')

@app.post('/groups')
def checkGroup():
    groups = open('Groups', 'r')
    nameToCheck = str(request.forms.get('groupName'))
    if nameToCheck == "":
        return template('mainPage.tpl') + '<p>Please enter a name in the field</p>'

    for line in groups:
        fields = line.split(":")
        pGroupName = fields[0]
        if nameToCheck == str(pGroupName):
            global userNames
            userNames = fields[3].split(',')
            nameString = ""
            for names in userNames[:-1]:
                nameString = nameString + names + ", "
                if userNames.count(', ') < 1:
                    nameString = "<p> There are no users in the %s group" % nameToCheck
                    return template('groupPage.tpl', groupName=nameToCheck, printUsers=nameString)

            return template('groupPage.tpl', groupName=nameToCheck, printUsers=nameString)
    return template('mainPage.tpl') + '<p>That group does not exist, try again</p>'

@app.post('/changes')
def makeChange():
    yesRadio = request.forms.get('yes')
    noRadio = request.forms.get('no')
    if yesRadio == "yesRad":
        for names in userNames:
            a = 1

        return template('groupChange.tpl'), "<h1> Page Coming Soon!</h1>"
    elif noRadio == "noRad":
        return template('mainPage.tpl')



run(app, host='localhost', port=8080, debug=True, reloader=True)