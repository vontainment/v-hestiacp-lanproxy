#=======================================================================#
# Vontainment Web Design, Social Media, Marketing & Tech Consulting     #
# EdgeRouter by Ubiqiti proxy template https://vontainment.com          #                                   
#=======================================================================#

server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;
    error_log  /var/log/%web_system%/domains/%domain%.error.log error;
    include %home%/%user%/conf/web/%domain%/nginx.forcessl.conf*;

        location /ws {
                proxy_pass https://192.168.1.1:80;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "Upgrade";
	        proxy_set_header Host $http_host;
                allow   192.168.0.0/16;
                deny    all;
        }
        location / {
	        proxy_pass https://192.168.1.1:80;
	        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	        proxy_set_header Host $http_host;
	        proxy_set_header X-Forwarded-Proto $scheme;
	        proxy_set_header X-Real-IP $remote_addr;
	        proxy_set_header Upgrade $http_upgrade;
	        proxy_set_header Connection "Upgrade";
	        proxy_buffering off;
	        proxy_ssl_verify off;
                allow   192.168.0.0/16;
                deny    all;
        }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    include %home%/%user%/conf/web/%domain%/nginx.conf_*;
}

