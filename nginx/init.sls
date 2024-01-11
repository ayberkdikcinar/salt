install_nginx:
  pkg.installed:
    - pkgs:
      - nginx

index_html:
  file.managed:
    - name: /usr/share/nginx/html/index.html
    - user: nginx
    - group: nginx
    - mode: 644  
    - source: salt://nginx/templates/index.html

nginx_service:
  service.running:
    - name: nginx
    - enable: True