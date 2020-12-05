import base64
import os
import databaseConnect as db
import re

fileLocationTrue = "C://Users//teemu//OneDrive//Asiakirjat//Koulujuttuja//testImage.jpg"
fileLocation = "C:/Users/teemu/OneDrive/Asiakirjat/Koulujuttuja/"
fileType = "jpg"
def getImage(fileName):
    try:
        fileName = fileName.strip()
        filepath = os.path.join(fileLocation+fileName+"."+fileType)
        with open(filepath, "rb") as image:
            imageFile = base64.b64encode(image.read())
        image.close()
        return imageFile

    except IOError:
        print("File not found")


def saveImage(fileName, fileData):

    fileName = fileName.strip()
    fullFileName = os.path.join(fileLocation+fileName+"."+fileType)
    
    with open(fullFileName, 'wb') as f:
        f.write(fileData.decode('base64'))
        print("Writing done, imagename: " + fileName)
    f.close()

def getImageSQLQueryEverything():
    query = '''Select * from Devices'''
    imageNames = str(db.sqlQuery(query))
    print(imageNames)
    #imageNames = imageNames.translate(None, "()")
    imageNames = imageNames.split(", (")
    print(imageNames)
    return imageNames


getImageSQLQueryEverything()