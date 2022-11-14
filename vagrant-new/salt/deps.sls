
{% for pkg in pillar.get('packages', []) %}
{{ pkg }}:
  pkg.installed:
    - pkgs:
      - {{ pkg }}
{% endfor %}
