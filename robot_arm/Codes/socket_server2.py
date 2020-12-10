import socket, _thread
import database as db
import time

host = '169.254.18.138'
port = 60065

while True:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sct:
        sct.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sct.bind((host, port))
        sct.listen()
        conn, addr = sct.accept()
        with conn:
            print('New Connection: ', addr)
            while True:
                data = conn.recv(1024)
                if not data:
                    break
                data = db.database_func()
                send_data = '[' + str(3) + ']'
                conn.sendall(send_data.encode())
                sct.close()
                #time.sleep(1)