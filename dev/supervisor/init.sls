python_deps:
  pkg.installed:
    - pkgs:
      - python-setuptools
      - python-pip

upgrade_deps:
  pkg.installed:
    - pkgs:
      - pip
      - setuptools
    - upgrade: true
    - require:
        - sls: python_deps
     
supervisord_install_pip:
  pip.installed:
    - pkgs:
      - supervisor
      - Distribute
    - force_reinstall: true
    - upgrade: true

