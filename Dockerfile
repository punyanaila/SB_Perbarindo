FROM webdevops/php-nginx:8.2-alpine

WORKDIR /app

COPY . .

RUN composer install --no-dev --optimize-autoloader
RUN npm install && npm run build

ENV WEB_DOCUMENT_ROOT=/app/public

EXPOSE 8080

CMD ["supervisord"]
