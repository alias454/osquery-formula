{% from "osquery/map.jinja" import host_lookup as config with context %}

# Manage the osquery.flags file
/etc/osquery/osquery.flags:
  file.managed:
    - contents: |
        --config_plugin=filesystem
    - user: root
    - group: root
    - mode: '0644'

# Manage symlink for flags file
osquery-symlink-flags:
  file.symlink:
    - name: /etc/osquery/osquery.flags.default
    - target: /etc/osquery/osquery.flags
    - user: root
    - group: root

# Manage the osquery.conf file
/etc/osquery/osquery.conf:
  file.serialize:
    - dataset: 
        {{ config.osquery.config_dataset|yaml }}
    - formatter: json
    - user: root
    - group: root
    - mode: '0644'
