{%- from "chkrootkit/map.jinja" import chkrootkit with context -%}

{{ chkrootkit.pkg }}:
  pkg.installed
