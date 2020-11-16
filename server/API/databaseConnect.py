import pymysql
import paramiko
import pandas as pd
from paramiko import SSHClient
from sshtunnel import SSHTunnelForwarder
from os.path import expanduser


with open("C:\\Users\\teemu\\OneDrive\\Asiakirjat\\Koulujuttuja\\PRojekti avaintiedosto\\login_info.txt", "r") as f:
    login_info = [line.strip() for line in f]

sql_hostname = login_info[0]
sql_username = login_info[1]
sql_password = login_info[2]
sql_main_database = login_info[3]
sql_port = int(login_info[4])
ssh_host = login_info[5]
ssh_user = login_info[6]
ssh_port = int(login_info[7])
sql_ip = login_info[8]

home = expanduser('~')
mypkey = paramiko.RSAKey.from_private_key_file("C:\\Users\\teemu\\OneDrive\\Asiakirjat\\Koulujuttuja\\PRojekti avaintiedosto\\openssh_key", login_info[9])


def sqlQuery(query):
    with SSHTunnelForwarder(
        (ssh_host, ssh_port),
        ssh_username=ssh_user,
        ssh_pkey=mypkey,
        remote_bind_address=(sql_hostname, sql_port)) as tunnel:
            conn = pymysql.connect(host='127.0.0.1', user=sql_username,
                    passwd=sql_password, db=sql_main_database,
                    port=tunnel.local_bind_port)
            cursor = conn.cursor()
            cursor.execute(query)
            data = cursor.fetchall()
            return data

def sqlInsert(input):
    with SSHTunnelForwarder(
        (ssh_host, ssh_port),
        ssh_username=ssh_user,
        ssh_pkey=mypkey,
        remote_bind_address=(sql_hostname, sql_port)) as tunnel:
            conn = pymysql.connect(host='127.0.0.1', user=sql_username,
                    passwd=sql_password, db=sql_main_database,
                    port=tunnel.local_bind_port)
            cursor = conn.cursor()
            cursor.execute(input)
            conn.commit()
            return