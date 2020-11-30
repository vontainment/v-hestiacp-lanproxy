#=======================================================================#
# Vontainment Web Design, Social Media, Marketing & Tech Consulting     #
# TP link proxy template https://vontainment.com                        #                                   
#=======================================================================#

server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;    
    include %home%/%user%/conf/web/%domain%/nginx.forcessl.conf*;

    location / {
        proxy_pass      http://192.168.1.25:80;
        proxy_http_version 1.1;
        proxy_buffering off;
        allow   192.168.0.0/16;
        deny    all;
    }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    include %home%/%user%/conf/web/%domain%/nginx.conf_*;
}
