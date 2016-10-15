FROM django

ADD . /app

WORKDIR /app

RUN ["apt-get", "install", "npm"]

RUN ["npm", "install", "-g","bower"]

RUN ["pip", "install", "django-bower"]

RUN ["python", "manage.py", "bower", "update"]

RUN ["python", "manage.py", "collectstatic", "--noinput"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]