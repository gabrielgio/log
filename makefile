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
NP=log-pi

log: docker-build
	$(D) $(R) -d -p $(T):8000 $(N)

log-pi: docker-build-pi
	$(D) $(R) -d -p $(T):8000 $(NP)

docker-build-pi: bcollect
	sed 's/FROM [a-zA-Z0-9\/]*/FROM clemenshemmerling\/rpi-django/' Dockerfile | $(D) $(U) $(NP) -

docker-build: bcollect
	$(D) $(U) $(N) $(F)

bcollect: binstall
	$(P) $(M) $(C) --no-input

binstall:
	$(P) $(M) $(B) $(I)
