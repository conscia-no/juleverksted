## Et eksempel med ISE

Nå har det vært mye tekst! La oss lage en playbook der vi snakker med ISE.

# Inventory

Vi trenger først en inventory fil.
Åpne inventory.yml filen og slett linjen som ligger der.

Legg inn følgende:
```
all:
  hosts:
    ise1:
      ansible_host: devnetsandboxise.cisco.com
      ansible_connection: httpapi
      ansible_network_os: cisco.ise.ise
      ansible_httpapi_use_ssl: yes
      ansible_httpapi_validate_certs: no
      ansible_user: {{ ise_username }}
      ansible_password: "{{ ise_password }}"
```
Se dokumentasjonen til modulen du skal jobbe med for hva den trenger - men vi ser kjapt at vi skal bruke https, vi skal ignorere sertifikatfeil, vi skal logge inn med brukernavn og passord som vi får fra en variabel.

# Playbook

Lag en ny fil som heter ise-facts.yml Her skal vi lese ut litt informasjon og vise på skjermen.

Lim inn følgende:
```
---
- name: Collect Cisco ISE facts
  hosts: ise1
  gather_facts: no

  tasks:
    - name: Gather system facts from ISE
      cisco.ise.system_facts:
      register: ise_sys

    - name: Show system facts
      debug:
        var: ise_sys

    - name: Get node facts
      cisco.ise.node_facts:
      register: ise_node

    - name: Show node facts
      debug:
        var: ise_node

    - name: Fetch version info
      cisco.ise.version_info:
      register: ise_version

    - debug:
        var: ise_version
```

Vi ser at vi bruker ulike moduler: Først cisco.ise.system_facts, så cisco.ise.node_facts og til slutt cisco.ise.varsion_info.
cisco.ise.system_facts henter cluster-nivå informasjon, cisco.ise.node_facts henter informasjon om ise hosten og til slutt bruker vi cisco.ise.version_info for å hente versjonen av ISE som er installert.

Vi kjører playbooken med: `./run-ansible.sh -i inventory.yml -e "username=<brukernavn>  password=<passord>" ise-facts.yml`

Brukernavnet og passordet får dere som chatmelding i webex.


OK, på tide å hoppe i det. ChatGPT har laget oppgaver til oss, de finner du [her](ChatGPT_challenges_readme.md) De enkleste oppgavene har vi allerede gjort her. Blir du ferdig? Det hadde vært gøy å automatisere ta backup av og å reinstallere en ISE, kanskje på Proxmox?

Vi har satt opp en ISE server i lab, adresse, brukernavn og passord ligger også i webex chat'en. Logg inn og opprett deres egen bruker, så blir det enklere for alle. Husk å gi brukeren en rolle som har lov til å bruke API'et!