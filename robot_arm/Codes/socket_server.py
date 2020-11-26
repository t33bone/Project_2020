import socket, _thread

def SocketServer(send_data):
	host = '169.254.149.203'
	port = 29994

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sct:
		sct.bind((host, port))
		sct.listen()
		conn, addr = sct.accept()
		with conn:
			print('New Connection: ', addr)
			while True:
				data = conn.recv(1024)
				if not data:
					break
				conn.sendall(send_data.encode())
