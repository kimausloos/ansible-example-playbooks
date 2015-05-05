server {
    listen   80;
    root /var/www/project/current/web/;

    location / {
        # try to serve file directly, fallback to app.php
        try_files $uri /app.php$is_args$args;
    }

    location ~ ^/app\.php(/|$) {
        fastcgi_pass unix:/tmp/phpfpm-default-pool.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS off;
        internal;
    }

    error_log   /var/log/nginx/project_error.log;
    access_log  /var/log/nginx/project_access.log;
}