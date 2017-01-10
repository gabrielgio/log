P=python
M=manage.py
B=bower
I=install
C=collectstatic
D=docker
R=run
T=8000
F=Dockerfile
U=build
N=log
PI=pip
NP=npm
A=apt-get

all:
	$(D) $(U) -t $(N) .

pi:
	sed 's/FROM [a-zA-Z0-9\/]*/FROM clemenshemmerling\/rpi-django/' $(F) | $(D) $(U) -t $(N) -

run:
	$(D) $(R) -d -p $(T):8000 $(N)

bcollect: binstall
	$(P) $(M) $(C) --noinput

binstall:
	$(P) $(M) $(B) $(I)

docker-stop:
	-docker stop $(docker ps -a -q  --filter ancestor=log)

docker-clean:
	-docker rm `docker ps --no-trunc -aq`
	-docker images -q | xargs docker rmi -f

pre:
	$(A) $(I) npm -y
	$(A) $(I) nodejs-legacy -y
	$(NP) $(I) bower
	$(PI) $(I) django
	$(PI) $(I) django_compress
	$(PI) $(I) django-bower
	$(PI) $(I) django-settings-export
	$(PI) $(I) pytz
	$(PI) $(I) markdown2
	$(PI) $(I) django_compressor
	$(PI) $(I) django-htmlmin
