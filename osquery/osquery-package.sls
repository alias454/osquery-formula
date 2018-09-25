{% from "osquery/map.jinja" import host_lookup as config with context %}
{% if config.package.install_type == 'package' %}

# Install osquery from a package
package-install-osquery:
  pkg.installed:
    - pkgs:
      - {{ config.osquery.package }}
    - refresh: True
    - skip_verify: {{ config.package.skip_verify }}
    - require_in:
      - service: service-osquery

{% elif config.package.install_type == 'local' %}
{% if config.package.install_type == 'local' %}

# Install osquery from a local package
package-install-osquery:
  pkg.installed:
    - sources:
    {% for package in config.package.local_package %}
      - {{ package.name }}: salt://osquery/files/{{ package.package }}.{{ package.type }}
    {% endfor %}
    - refresh: True
    - skip_verify: {{ config.package.skip_verify }}
    - require_in:
      - service: service-osquery

{% endif %}
