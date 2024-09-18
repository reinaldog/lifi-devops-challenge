FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY ./index.html /usr/share/nginx/html/index.html
COPY ./index.html /etc/nginx/html/index.html
COPY ./config.js /usr/share/nginx/html/config.js
COPY ./favicon.ico /usr/share/nginx/html/favicon.ico
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
