{%- from "chkrootkit/map.jinja" import chkrootkit with context -%}

{{ chkrootkit.pkg }}:
  pkg.installed
  file.managed:
    - name: /etc/chkrootkit.conf
    - source: salt://chkrootkit/templates/chkrootkit.conf.jinja
    - template: jinja
    - mode: 644
