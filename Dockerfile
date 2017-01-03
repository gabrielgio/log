FROM django

ADD . /app

WORKDIR /app

RUN ["apt-get", "update"]

RUN ["apt-get", "install", "make"]

RUN ["make", "pre"]

CMD ["python" , "manage.py", "migrate"]

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
