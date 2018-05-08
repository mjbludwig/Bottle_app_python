
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
            userNames = (fields[3].strip()).split(',')
            #return str(userNames)
            if len(userNames) <= 1:
                return template('mainPage.tpl') + '<p>There are no Users in that group, additions need to be handled administratively.</p>'
            else:
                userNames.sort()
                return template('groupPage.tpl', groupName=nameToCheck, printUsers=userNames)
    return template('mainPage.tpl') + '<p>That group does not exist, try again</p>'

@app.post('/changes')
def makeChange():
    yesRadio = request.forms.get('yes')
    noRadio = request.forms.get('no')
    if yesRadio == "yesRad":
        for names in userNames:
            a = 1

        return template('groupChange.tpl', printUsers=userNames)
    elif noRadio == "noRad":
        return template('mainPage.tpl')
    else:
        global nameToCheck
        global nameString
        return template('groupPage.tpl', groupName=nameToCheck, printUsers=nameString) + "<p> Please select and option </p>"

@app.post('/changes-made')
def implementChanges():
    usersToDeleteAll = []
    usersToSuspend = []
    usersToDelete = []
    for user in userNames:
        if request.forms.get(user) == "deleteAll":
            usersToDeleteAll.append(user)
        elif request.forms.get(user) == "suspend":
            usersToSuspend.append(user)
        elif request.forms.get(user) == "delete":
            usersToDelete.append(user)
    return str(usersToDelete), str(usersToSuspend), str(usersToDeleteAll)





run(app, host='localhost', port=8080, debug=True, reloader=True)