{% from "osquery/map.jinja" import host_lookup as config with context %}
{% if config.package.install_type == 'package' %}
# Installing from package

# Configure repo file for RHEL based systems
{% if salt.grains.get('os_family') == 'RedHat' %}
osquery_repo:
  pkgrepo.managed:
    - name: osquery
    - comments: |
        # Managed by Salt Do not edit
        # OSquery repository for {{ config.package.repo_version }} packages
    - baseurl: {{ config.package.repo_baseurl }}
    - gpgcheck: 1
    - gpgkey: {{ config.package.repo_gpgkey }}
    - enabled: 1

# Configure GPG key file for repo
/etc/pki/rpm-gpg/RPM-GPG-KEY-osquery:
  file.managed:
    - source: https://pkg.osquery.io/rpm/GPG 
    - source_hash: ef2c7381530982c208fe129442511e93
    - user: root
    - group: root
    - onchanges:
      - pkgrepo: osquery_repo

# Configure repo file for Debian based systems
{% elif salt.grains.get('os_family') == 'Debian' %}
# Import keys for osquery
#command-apt-key-osquery:
  #cmd.run:
    #- name: apt-key adv --keyserver {{ config.package.repo_key }}
    #- unless: apt-key list osquery

osquery_repo:
  pkgrepo.managed:
    - name: {{ config.package.repo_baseurl }} /
    - file: /etc/apt/sources.list.d/osquery.list
    - comments: |
        # Managed by Salt Do not edit
        # OSquery repository for {{ config.package.repo_version }} packages (Debian) 
    - keyserver: {{ config.package.repo_keyserver }}
    - keyid: {{ config.package.repo_key }}
{% endif %}

{% endif %}
