FROM django

ADD . /app

WORKDIR /app

RUN ["apt-get", "update"]

RUN ["apt-get", "install", "npm", "-y"]

RUN ["apt-get", "install", "nodejs-legacy", "-y"]

RUN ["npm", "install", "bower", "-g", "--allow-root"]

RUN ["pip", "install", "django"]

RUN ["pip", "install", "django_compress"]

RUN ["pip", "install", "django-bower"]

RUN ["pip", "install", "django-settings-export"]

RUN ["pip", "install", "pytz"]

RUN ["pip", "install", "markdown2"]

RUN ["pip", "install", "django_compressor"]

RUN ["pip", "install", "django-htmlmin"]

RUN ["make" , "bcollect"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
