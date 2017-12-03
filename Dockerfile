FROM django

ADD . /app

WORKDIR /app

RUN ["apt-get", "update"]

RUN ["apt-get", "install", "npm", "-y"]

RUN ["apt-get", "install", "nodejs-legacy", "-y"]

RUN ["npm", "install", "bower", "-g", "--allow-root"]

RUN ["pip", "install", "-r", "requirements.txt"]

RUN ["python", "manage.py", "bower", "install"]

RUN ["python", "manage.py", "collectstatic", "--noinput"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
