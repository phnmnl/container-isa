FROM ubuntu:xenial
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software="Iterative Signature Algorithm [ISA]"
LABEL description="Iterative Signature Algorithm [ISA]"
LABEL website="https://www2.unil.ch/cbg/index.php?title=ISA"
LABEL base.image="ubuntu:xenial"
LABEL software.version="0.0.2"
LABEL version="0.0.2"
LABEL software="iterative-signature-algorithm"

RUN apt-get -y update && \
	apt-get install -y python3-numpy python3-scipy python3-pandas git && \
	apt-get -y clean && \
	apt-get -y autoremove && \
	rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

RUN echo "1...2"
RUN git clone --depth 1 --single-branch -b init https://github.com/rrueedi/isa-py.git /isa
RUN cp /isa/*.py /usr/local/bin/

WORKDIR /isa

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

#RUN chmod a+rx \
#	/usr/local/bin/isa.py \
#	/usr/local/bin/isawrp.py

ENTRYPOINT ["isawrp.py"]

