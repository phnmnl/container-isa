FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software="iterative-signature-algorithm"
LABEL description="Iterative Signature Algorithm [ISA], python3"
LABEL website="https://www2.unil.ch/cbg/index.php?title=ISA"
LABEL documentation="https://www2.unil.ch/cbg/index.php?title=ISA"
LABEL license="https://www2.unil.ch/cbg/index.php?title=ISA"
LABEL base.image="ubuntu:16.04"
LABEL software.version="0.1"
LABEL version="0.1"
LABEL tags="Biclustering"

RUN apt-get -y update && \
	apt-get install -y python3-numpy python3-scipy python3-pandas git && \
	apt-get -y clean && \
	apt-get -y autoremove && \
	rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

RUN git clone -b ini/20180625T1800 https://github.com/rrueedi/isa-py.git /isa
RUN cp /isa/*.py /usr/local/bin/

WORKDIR /isa

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod +x /usr/local/bin/runTest1.sh

#RUN chmod a+rx \
#	/usr/local/bin/isa.py \
#	/usr/local/bin/isawrp.py

ENTRYPOINT ["isawrp.py"]

