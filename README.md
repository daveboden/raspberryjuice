The daveboden/raspberryjuice docker image has also be been uploaded to Docker Hub, so you can run the server using

0. `docker run -it -p 25565:25565 -p 4711:4711 daveboden/raspberryjuice`
0. To run the server so that your world is persisted onto disk (replace 'MyUsername' in the command).
   `docker run -it -p 25565:25565 -p 4711:4711 -v /c/Users/MyUsername/python-minecraft/world:/spigot/world daveboden/raspberryjuice`
0. Find out your Docker VM's IP (on my PC, it's 192.168.99.100 by default). `docker-machine ip <machine-name>`
0. Run Minecraft and add your IP as a new server.
0. Join Multiplayer.
0. Now you are ready to interact with Minecraft using Python!

Alternatively, you can clone this repository, modify the Dockerfile and server.properties files and build your own Docker image with:
`docker build -t YourUsername/raspberryjuice .`
Once the image is installed locally, you can replace daveboden/raspberryjuice with YourUsername/raspberryjuice in the docker run commands above. You could choose to share your version of the Dockerfile to Docker Hub using `docker login` and then `docker push YourUsername/raspberryjuice`.