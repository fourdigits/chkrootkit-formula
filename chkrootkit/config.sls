{% from "chkrootkit/map.jinja" import chkrootkit with context %}

include:
  - chkrootkit

# Config
{{ chkrootkit.config_dir }}:
  file.directory:
    - mode: 755

{{ chkrootkit.log_dir }}:
  file.directory:
    - mode: 755

{{ chkrootkit.config }}:
  file.managed:
    - source: salt://chkrootkit/templates/chkrootkit.conf.jinja
    - template: jinja
    - mode: 644

{{ chkrootkit.config_dir}}/chkrootkit.sh:
  file.managed:
    - mode: 700
    - source: salt://chkrootkit/templates/chkrootkit.sh.jinja
    - template: jinja

{{ chkrootkit.exclude_file }}:
  file.managed:
    - source: salt://chkrootkit/templates/exclude.list.jinja
    - template: jinja
    - mode: 644

/etc/cron.daily/chkrootkit:
  file.symlink:
    - target: {{ chkrootkit.config_dir}}/chkrootkit.sh
    - force: True
