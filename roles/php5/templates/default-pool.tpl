[global]
pid = /var/run/phpfpm-default-pool.pid
error_log = syslog
daemonize = no

[www]
user = www-data
group = www-data

listen = /tmp/phpfpm-default-pool.sock
listen.owner = www-data
listen.group = www-data
listen.mode = 0666

pm = ondemand
pm.max_children = 10
slowlog = syslog