FROM ubuntu:latest
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.0.1"
LABEL version="0.0.1"
LABEL software="iterative-signature-algorithm"

RUN apt-get -y update && \
	apt-get install -y python3-numpy python3-scipy python3-pandas git && \
	apt-get -y clean && \
	apt-get -y autoremove && \
	rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

RUN git clone --depth 1 --single-branch -b init https://github.com/rrueedi/isa-py.git /isa
RUN cp /isa/*.py /usr/local/bin/

WORKDIR /isa

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

#RUN chmod a+rx \
#	/usr/local/bin/isa.py \
#	/usr/local/bin/isa.wrapper.py

ENTRYPOINT ["isa.wrapper.py"]

