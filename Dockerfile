# Starting point - Official image with OpenJRE 8
FROM java:8-jre

MAINTAINER wh11e7rue <wh11e7rue@icloud.com>

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

# Download from http://getspigot.org
RUN wget http://getspigot.org/spigot18/spigot_server.jar

# Download from https://github.com/zhuowei/RaspberryJuice
RUN wget -P plugins https://github.com/zhuowei/RaspberryJuice/raw/master/jars/raspberryjuice-1.7.jar

# for mcpi
EXPOSE 4711

# for minecraft
EXPOSE 25565

CMD java -Xmx1024M -Xms1024M -jar /spigot/spigot_server.jar
