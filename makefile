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

log: docker-build
	$(D) $(R) -d -p $(T):8000 $(N)

log-pi: docker-build-pi docker-clean
	$(D) $(R) -d -p $(T):8000 $(N)

docker-build-pi: bcollect docker-clean
	sed 's/FROM [a-zA-Z0-9\/]*/FROM clemenshemmerling\/rpi-django/' $(F) | $(D) $(U) -t $(N) -

docker-build: bcollect docker-clean
	$(D) $(U) -t $(N) .

bcollect: binstall
	$(P) $(M) $(C) --noinput

binstall:
	$(P) $(M) $(B) $(I)

docker-stop:
	-docker stop $(docker ps -a -q  --filter ancestor=log)

docker-clean: docker-stop
	-docker rm `docker ps --no-trunc -aq`
	-docker images -q | xargs docker rmi -f

pre:
	$(PI) $(I) django
	$(PI) $(I) django_compress
	$(PI) $(I) django-bower
	$(PI) $(I) django-settings-export
	$(PI) $(I) pytz
	$(PI) $(I) markdown2
	$(PI) $(I) django_compressor
	$(PI) $(I) django-htmlmin
