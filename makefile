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

log: docker-build stop-cont docker-clean
	$(D) $(R) -d -p $(T):8000 $(N)

log-pi: docker-build-pi stop-cont docker-clean
	$(D) $(R) -d -p $(T):8000 $(N)

docker-build-pi: bcollect
	sed 's/FROM [a-zA-Z0-9\/]*/FROM clemenshemmerling\/rpi-django/' $(F) | $(D) $(U) -t $(N) -

docker-build: bcollect
	$(D) $(U) -t $(N) $(F)

bcollect: binstall
	$(P) $(M) $(C) --noinput

binstall:
	$(P) $(M) $(B) $(I)

stop-cont:
ifneq ($(docker stop $(docker ps -a -q --filter ancestor=$(N) --format="{{.ID}}")),)
	$(D) rm $(docker stop $(docker ps -a -q --filter ancestor=$(N) --format="{{.ID}}"))
endif

docker-clean:
ifneq ($(docker images | grep "^<none>" | awk "{print $3}"),)
	$(D) rmi $(docker images | grep "^<none>" | awk "{print $3}")
endif

pre:
	$(PI) $(I) django
	$(PI) $(I) django_compress
	$(PI) $(I) django-bower
	$(PI) $(I) django-settings-export
	$(PI) $(I) markdown2
	$(NP) $(I) -g bower