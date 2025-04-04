#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM nginx:latest

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  apt-get install -y unzip && \
  apt-get install -y wget && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip && \
  unzip mediplus-lite.zip -d /usr/share/nginx/html && \
  rm -rf /usr/share/nginx/html/index.html && \
  rm -rf /usr/share/nginx/html/mediplus-lite.zip && \
  mv /usr/share/nginx/html/mediplus-lite/* /usr/share/nginx/html && \
  rm -rf /usr/share/nginx/html/mediplus-lite
  
  #tar --strip-components=1 -zxvf wordpress.tgz -C /usr/share/nginx/html && \
  
# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/usr/share/nginx/html", "/etc/nginx/certs", "/var/lib/nginx", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.#
EXPOSE 80
EXPOSE 443