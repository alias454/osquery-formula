{% from "osquery/map.jinja" import host_lookup as config with context %}
{% if config.osquery.use_logrotate == 'True' %}

# Manage logrotate config for osquery
{{ config.osquery.logrotate_config }}:
  file.managed:
    - contents: |
        /var/log/osquery/osqueryd.results.log {
            daily
            missingok
            rotate 30
            compress
            notifempty
        }
    - user: root
    - group: root
    - mode: '0644'

{% endif %}
