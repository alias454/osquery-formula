{% from "osquery/map.jinja" import host_lookup as config with context %}

# Make sure osquery service is running and restart needed
service-osquery:
  service.running:
    - name: {{ config.package.service }}
    - enable: True
