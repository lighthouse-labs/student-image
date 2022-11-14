{% if pillar['desktop'] == true %}
ubuntu-desktop:
  pkg.installed:
    - ubuntu-desktop

lightdm_conf:
  file.managed:
    - name: /etc/lightdm/lightdm.conf
    - contents:
      - [SeatDefaults]
      - autologin-user={{ pillar['user'] }}

gdm_conf:
  file.manaed:
    - name: /etc/gdm/custom.conf
    - contents:
      - [daemon]
      - # Enabling automatic login
      - AutomaticLoginEnable=True
      - AutomaticLogin={{ pillar['user'] }}

{% endif %}
