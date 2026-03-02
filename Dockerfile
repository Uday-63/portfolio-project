FROM nginx:alpine

# Clean default html
RUN rm -rf /usr/share/nginx/html/*

# Copy only website files
COPY index.html /usr/share/nginx/html/
COPY css /usr/share/nginx/html/css
COPY js /usr/share/nginx/html/js
COPY images /usr/share/nginx/html/images

# Fix permissions
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
