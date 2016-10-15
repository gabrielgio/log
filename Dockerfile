FROM django

ADD . /app

WORKDIR /app

# install our dependencies and nodejs
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install python-software-properties git build-essential
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN ["npm", "install", "-g", "bower"]

RUN ["pip", "install", "markdown2"]

RUN ["pip", "install", "django-bower"]

CMD ["python" , "manage.py", "bower", "install"]

CMD ["python" , "manage.py", "collectstatic"]

CMD ["python" , "manage.py", "migrate"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
