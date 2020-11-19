import requests
from flask import json

getUrl = 'http://127.0.0.1:5000/api/testi/get/all'
postUrl = 'http://127.0.0.1:5000/api/testi/post/newDevice'


def getExample():
    #Example gets json data from url specified above
    getData = requests.get(getUrl)
    
    #converts the data to json
    response = getData.json()
    print(response)

def postExample():

    #anything regarding inputs can be changed but try to match the amount of data sent in the json Example
    uInput = {}

    for i in range(4):
        if i == 0:
            uInput[i] = raw_input("Give a integer: ")
        if i == 1:
            uInput[i] = raw_input("Give a char: ")
        if i == 2:
            uInput[i] = raw_input("Give a string: ")
        if i == 3:
            uInput[i] = raw_input("Give a string: ")

            
 # Example for a json object. For compatibility with server don't change the strings between " "
    jsonExample = {
                    "testinumeroINT": uInput[0],
                    "testichar": uInput[1],
                    "testiTeksti": uInput[2],
                    "testiTeksti2": uInput[3],
                  }

    #Sends a post request to url specified in the beginning, that is the server url, don't change
    x = requests.post(postUrl, json = jsonExample)

    return "post success"


while(True):
    x = raw_input("1: Get method \n2: Post method ")

    if int(x) == 2:
        postExample()
    else:
        getExample()