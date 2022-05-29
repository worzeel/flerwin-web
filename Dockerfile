FROM nginx

COPY index.html /usr/share/nginx/html
COPY main.min.js /usr/share/nginx/html