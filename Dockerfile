# Starting point - Official image with OpenJRE 8
FROM java:8-jre

#MAINTAINER wh11e7rue <wh11e7rue@icloud.com>

WORKDIR /spigot

# Accept Mojang EULA
RUN echo "eula=TRUE" > eula.txt

# Silence harmless but scary sounding errors
RUN echo "[]" > banned-ips.json
RUN echo "[]" > banned-players.json
RUN echo "[]" > ops.json
RUN echo "[]" > usercache.json
RUN echo "[]" > whitelist.json

# Add server settings
ADD server.properties /spigot/

# Download spigot
RUN wget https://ci.mcadmin.net/job/Spigot/68/artifact/spigot-1.9.4.jar

# Download RaspberryJuice plugin
RUN wget -P plugins https://github.com/zhuowei/RaspberryJuice/raw/master/jars/raspberryjuice-1.8.jar

# for mcpi
EXPOSE 4711

# for minecraft
EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar /spigot/spigot-1.9.4.jar
