import requests
from flask import json

getUrl = 'http://127.0.0.1:5000/api/testi/get/all'
postUrl = 'http://127.0.0.1:5000/api/testi/post/newDevice'


def getExample():
    getData = requests.get(getUrl)
    response = getData.json()
    print(response)

def postExample():

    input1 = raw_input("Give integer: ")
    input2 = raw_input("give char(45): ")

    jsonExample = {
                    "testinumeroINT": input1,
                    "testichar": input2
                  }

    x = requests.post(postUrl, json = jsonExample)

    return "post success"


while(True):
    x = raw_input("1: Get method \n2: Post method ")

    if int(x) == 2:
        postExample()
    else:
        getExample()