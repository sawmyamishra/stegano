FROM ubuntu

ENV TZ=Asia

ADD picture.jpg ./picture.jpg
ADD secret.txt ./secret.txt

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install steghide -y && \
    apt-get install nano -y && \
    apt-get install apache2 -y && \
    apt-get install nginx -y && \
    apt-get clean

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]    
