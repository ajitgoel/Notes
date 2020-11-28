a. Download ngrok from 
b. run cmd in admin mode. 
cd C:\Users\ajitg\Downloads\ngrok-stable-windows-amd64
c. run the following command: 
`ngrok http https://localhost:44348 -host-header="localhost:44348"` where the port number is the port that the https ssl port, the application is running on. 

