FROM python:3
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )
LABEL software.verion="0.0.1"
LABEL version="0.0.1"
LABEL software="iterative-signature-algorithm"
RUN git clone https://github.com/rrueedi/metabomatching.git /isa
RUN cp /isa/*.py /usr/local/bin/
RUN chmod a+rx \
	/usr/local/bin/isa.py \
	/usr/local/bin/isa.wrapper.py
ENTRYPOINT ["isa.wrapper.py"]

