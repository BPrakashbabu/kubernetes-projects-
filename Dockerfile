FROM quay.io/centos/centos:stream9

LABEL maintainer="prakash@gmail.com"

# Install required packages
RUN dnf -y update && \
    dnf -y install java-11-openjdk httpd zip unzip && \
    dnf clean all

# Download and extract website
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip -q photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose only required port
EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
