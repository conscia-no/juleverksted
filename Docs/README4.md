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
      ansible_host: 10.1.112.166
      ansible_connection: httpapi
      ansible_httpapi_use_ssl: yes
      ansible_httpapi_validate_certs: no
      ansible_user: "{{ username }}"
      ansible_password: "{{ password }}"
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
  
    - name: Get node facts
      cisco.ise.node_info:
        ise_hostname: "{{hostvars[inventory_hostname].ansible_host}}"
        ise_username: "{{username}}"
        ise_password: "{{password}}"
        ise_verify: "no"
      register: ise_node

    - name: Show node facts
      debug:
        var: ise_node.ise_response

    - name: Get Node Deployment Info
      cisco.ise.patch_info:
        ise_hostname: "{{hostvars[inventory_hostname].ansible_host}}"
        ise_username: "{{username}}"
        ise_password: "{{password}}"
        ise_verify: "no"
      register: patch_info

    - name: Show patch_info
      ansible.builtin.debug:
        var: patch_info.ise_response
```

Vi ser at vi bruker ulike moduler: Først cisco.ise.node_info, og registrerer returvariablene fra denne som `ise_node`. Så kjører vi cisco.ise.patch_info.
cisco.ise.node_info henter navnet på ISE installasjonen, cisco.ise.patch_info henter informasjon om hvilke patcher som er installerte.

Vi kjører playbooken med: `./run-ansible.sh ansible-playbook -i inventory.yml -e username=<brukernavn>  -e password=<passord> ise-facts.yml`

Brukernavnet og passordet får dere som chatmelding i webex.


OK, på tide å hoppe i det. ChatGPT har laget oppgaver til oss, de finner du [her](ChatGPT_challenges_readme.md) De enkleste oppgavene har vi allerede gjort her. Blir du ferdig? Det hadde vært gøy å automatisere ta backup av og å reinstallere en ISE, kanskje på Proxmox?

Vi har satt opp en ISE server i lab, adresse, brukernavn og passord ligger også i webex chat'en. Logg inn og opprett deres egen bruker, så blir det enklere for alle. Husk å gi brukeren en rolle som har lov til å bruke API'et!