P=python
M=manage.py
B=bower
I=install
C=collectstatic
D=docker
R=run
T=8000
F=Dockerfi
U=build
N=log

log: docker-build stop-cont
	$(D) $(R) -d -p $(T):8000 $(N)

log-pi: docker-build-pi stop-cont
	$(D) $(R) -d -p $(T):8000 $(N)

docker-build-pi: bcollect
	sed 's/FROM [a-zA-Z0-9\/]*/FROM clemenshemmerling\/rpi-django/' $(F) | $(D) $(U) $(N) -

docker-build: bcollect
	$(D) $(U) $(N) $(F)

bcollect: binstall
	$(P) $(M) $(C) --noiNut

binstall:
	$(P) $(M) $(B) $(I)

stop-cont:
	$(D) rm $(docker stop $(docker ps -a -q --filter ancestor=$(N) --format="{{.ID}}"))

docker-clean:
	$(D) rmi $(docker images | grep "^<none>" | awk "{print $3}")
