
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
    global nameToCheck
    nameToCheck = str(request.forms.get('groupName'))
    if nameToCheck == "":
        return template('mainPage.tpl') + '<p>Please enter a name in the field</p>'

    for line in groups:
        fields = line.split(":")
        pGroupName = fields[0]
        if nameToCheck == str(pGroupName):
            global userNames
            userNames = fields[3].split(',')
            if len(userNames) < 1:
                return template('mainPage.tpl') + '<p>There are no Users in that group, additions need to be handled administratively.</p>'
            global nameString
            nameString = ", ".join(userNames)
            return template('groupPage.tpl', groupName=nameToCheck, printUsers=userNames)
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
    else:
        global nameToCheck
        global nameString
        return template('groupPage.tpl', groupName=nameToCheck, printUsers=nameString) + "<p> Please select and option </p>"



run(app, host='localhost', port=8080, debug=True, reloader=True)