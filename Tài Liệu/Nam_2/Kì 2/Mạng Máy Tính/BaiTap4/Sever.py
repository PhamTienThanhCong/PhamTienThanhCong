# Write socket TCP server program
import socket
import sys
import time
from socket import *
from unicodedata import name
ipsever = "192.168.0.104"
serverPort = 12000
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.bind((ipsever, serverPort))
serverSocket.listen(5)
print ("The server is ready to receive")
while True:
    connectionSocket, addr = serverSocket.accept()
    MSSV = connectionSocket.recv(1024).decode()
    connectionSocket.send(MSSV.encode())
    name = connectionSocket.recv(1024).decode()
    connectionSocket.send(name.encode())
    time_send = connectionSocket.recv(1024).decode()
    connectionSocket.send(time_send.encode())
    ip = connectionSocket.recv(1024).decode()
    connectionSocket.send(ipsever.encode())
    size = connectionSocket.recv(1024).decode()
    size = sys.getsizeof(MSSV) + sys.getsizeof(name) + sys.getsizeof(time_send) + sys.getsizeof(ip) + sys.getsizeof(size)
    connectionSocket.send(str(size).encode())
    connectionSocket.close()
