include: 
  - supervisor

install_flask_pip:
  pip.installed:
    - pkgs:
      - flask

create_app_dir:
  file.directory:
    - name: /app
    - user: root
    - group: root
    - mode: 0755

create_flask_app_dir:
  file.directory:
    - name: /app/flask_app
    - user: root
    - group: root
    - mode: 0755
    - require:
        - file: create_app_dir
