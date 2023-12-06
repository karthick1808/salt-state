# File: apache.sls
# Install Apache package
apache_installed:
  pkg.installed:
    - name: apache2
    - refresh: True

# Create a simple Apache configuration file
apache_configured:
  file.managed:
    - name: /etc/apache2/sites-available/default
    - source: salt://apache/default

# Ensure Apache is running and enabled
apache_service_running:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - file: apache_configured
