# Write socket TCP client program
from http import client
import time 
from socket import *
serverName = "192.168.0.104"
serverPort = 12000
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName,serverPort))
MSSV = input("Input MSSV :")
clientSocket.send(MSSV.encode())
maso = clientSocket.recv(1024)
name = input("Input name :")
clientSocket.send(name.encode())
hoten = clientSocket.recv(1024)
time_send = time.ctime()
clientSocket.send(time_send.encode())
timesend = clientSocket.recv(1024)
print ("From Server:")
print ("MSSV:", maso.decode())
print ("Name:", hoten.decode())
time_receive = time.ctime()
print ("Time send:", timesend.decode())
print ("Time Recieve:", time_receive)
clientSocket.send("Send me IP".encode())
ipsever = clientSocket.recv(1024)
print ("IP sever:", ipsever.decode())
print ("IP Client:", serverName)
clientSocket.send("Send me size".encode())
size = clientSocket.recv(1024)
print ("Size of file :", size.decode())
clientSocket.close()