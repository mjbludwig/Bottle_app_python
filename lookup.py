
from bottle import route, run, static_file
from bottle import *
import bottle
import os
import re

app = Bottle()
mghpccImg = '/images/mghpccImg.jpg'

@app.route('/images/<filename>')
def images(filename):
    return bottle.static_file(filename, root=os.path.join(os.getcwd(), 'static/images'))

@app.route('/')
def mainPage():
    return template('mainPage.tpl', backGround=mghpccImg, error="")


@app.post('/groups')
def checkGroup():
    groups = open('Groups', 'r')
    global nameToCheck
    nameToCheck = str(request.forms.get('groupName'))
    if nameToCheck == "":
        return template('mainPage.tpl', backGround=mghpccImg, error="noName")

    for line in groups:
        fields = line.split(":")
        pGroupName = fields[0]
        if nameToCheck == str(pGroupName):
            global userNames
            userNames = (fields[3].strip()).split(',')
            #return str(userNames)
            if len(userNames) <= 1:
                return template('mainPage.tpl', backGround=mghpccImg, error="noUsers")
            else:
                userNames.sort()
                return template('groupPage.tpl', groupName=nameToCheck, printUsers=userNames, backGround=mghpccImg)
    return template('mainPage.tpl', backGround=mghpccImg, error="noGroup")
@app.post('/groups/changes')
def makeChange():
    if request.forms.get('radioYesNo') == "yes":
        return template('groupChange.tpl', printUsers=userNames, backGround=mghpccImg)
    elif request.forms.get('radioYesNo') == "no":
        return template('mainPage.tpl', backGround=mghpccImg, error="")
    else:
        global nameToCheck
        return template('groupPage.tpl', groupName=nameToCheck, printUsers=userNames, backGround=mghpccImg) #+ "<p> Please select and option </p>"

@app.post('/groups/changes/changes-made')
def implementChanges():
    usersToDeleteAll = []
    usersToSuspend = []
    usersToDelete = []
    global userNames
    for user in userNames:
        if request.forms.get(user) == "deleteAll":
            usersToDeleteAll.append(user)
        elif request.forms.get(user) == "suspend":
            usersToSuspend.append(user)
        elif request.forms.get(user) == "delete":
            usersToDelete.append(user)
    return template('changes-made.tpl', backGround=mghpccImg, deleteAll=usersToDeleteAll, delete=usersToDelete, suspend=usersToSuspend)

@app.post('/group/changes/changes-made/submit')
def submitChanges():
    return template('submit.tpl', backGround=mghpccImg)




run(app, host='localhost', port=8080, debug=True, reloader=True)