FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1
EXPOSE 8080
RUN curl https://s3.amazonaws.com/boxes.10gen.com/build/toolchain/mongodbtoolchain-debian81-05171c41782300cdc96976d005a5b887b33bcc05.tar.gz | tar zxf - -C /opt
RUN rm -rf /var/app/{bin,lib,include}
RUN /opt/mongodbtoolchain/v2/bin/virtualenv /var/app
RUN /var/app/bin/pip install uwsgi
