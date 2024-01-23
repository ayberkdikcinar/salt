include:
  - flask

create_app:
  file.managed:
    - name: /app/flask_app/app.py
    - source: salt://app/templates/app.py
    - user: root
    - group: root
    - mode: 0755


create_supervisor_config:
  file.managed:
    - name: /app/flask_app/supervisor.conf
    - source: salt://app/templates/supervisor.conf
    - user: root
    - group: root
    - mode: 0755


configure_supervisord:
  cmd.run:
    - name: supervisord -c /app/flask_app/supervisor.conf
    - user: root
    - group: root
    - watch:
        - file: /app/flask_app/supervisor.conf

run_app:
  supervisord.running:
    - name: flask_app
    - user: root
    - watch:
        - file: /app/flask_app/app.py


