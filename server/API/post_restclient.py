#   
#   Table is in mydb, not in TestDataBase
#   works only with test_API.py

import requests
from flask import json
import os, os.path
import shutil
import time

directory = "D:\\OneDrive - Oulun ammattikorkeakoulu\\S2020_Projekti\\jsons\\"
archive = "D:\\OneDrive - Oulun ammattikorkeakoulu\\S2020_Projekti\\jsonarchive\\"

LINUX = False

if LINUX == False:
    postUrl = 'http://195.148.21.106/api/doori/post/newDoori'
else:
    postUrl = 'http://127.0.0.1:5000/api/doori/post/newDoori'

while(True):
    # Reads the number of files in a folder
    file_list = os.listdir(directory)
    filecount = len(file_list)
    print("Scanning file count:", filecount)

    while(filecount > 0):

        file_list = os.listdir(directory)
        filecount = len(file_list)

        for filename in file_list:
            print(filename)
            print(file_list)
            time.sleep(1)
            if filename.endswith(".json") or filename.endswith(".txt"):
                with open(directory + filename) as jo:
                    j_data = json.load(jo)
                    # Sends a post request to url specified in the beginning, that is the server url, don't change
                    print("Posting the data to: ", postUrl)
                    x = requests.post(postUrl, json = j_data)
                    # Print returns possible errors (eg. 404) or return returns a success if the post goes through
                    # todo: if an error returns, dont move files to an archive and do something else instead
                    print(x)
                    #j_print = json.dumps(j_data, indent=4)
                    #print(j_print)
                # move files to an archive folder
                shutil.move(directory + filename, archive + filename)
                print("Processed file moved to the archive.\n")
                time.sleep(1)
            else:
                break
    time.sleep(2)        
