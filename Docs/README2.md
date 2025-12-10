## Litt mer om ansible

Ansible er agentless - det vil si at vi installerer ikke noe på utstyret vi kommuniserer med. Ansible bruker ssh, API'er og andre metoder som WinRM.

Alt skrives i YAML. Trenger du en kjapp innføring i YAML, se [her](https://realpython.com/python-yaml/#yaml-syntax)

Ansible er skrevet for å være idempotent. Det vil si at du kan kjøre en playbook flere ganger, og du får det samme resultatet. Har du laget et objekt med et navn, så blir det ikke opprettet et nytt hvis du kjører playbooken på nytt. 

### Moduler og Collections

Ansible i seg selv kan ikke så mye, men benytter plugins kalt moduler til å snakke med ulike typer utstyr og tjenester. Disse kommmer i samlinger som heter collections, og er de som kommuniserer med utstyret du vil jobbe med. Collections installeres med kommandoen ```ansible-galaxy install <collection navn> ``` Men hva gjør de? Ta en kikk i [Ansible dokumentasjonen](https://docs.ansible.com/projects/ansible/11/collections/cisco/ise/index.html#plugin-index) og finn ut! Linken går til cisco.ise collection'en, men blar du i menyen til venstre finner du collections for andre cisco produkter og ting fra andre leverandører.

### Dokumentasjon

Ta en kikk på [cisco.ise.endpoint_info](https://docs.ansible.com/projects/ansible/11/collections/cisco/ise/endpoint_info_module.html#ansible-collections-cisco-ise-endpoint-info-module) modulen.

Du finner først et Synopsis kapittel, som forteller hva modulen gjør, så kommer Parameters som viser hvordan man kan tilpasse spørringene, hvilke parametre som er påkrevet osv.
Etter det kommer eksempler på bruk. Til slutt kommer eksempler på hvordan dataene man får tilbake er formatert. Vi er dypt nedi nerdeland her - det er lov å spørre chatgpt nå.

Under Requirements har cisco.ise for øvrig noen krav til ting som skal være installert. Vi har gjort det under byggingen av docker imaget for cisco.ise, men prøver du å gå mot noe annet enn ise, ta en kikk i Dockerfile filen. Du kan se hvor collections blir installert og hvor andre ting blir installert. Gjør du endringer: Kjør build kommandoen på nytt.

### Looper

Ansible er flink til å gjøre de samme tingene på flere maskiner i parallell, men noen ganger skal man gjøre de samme tingene på flere objekter på samme maskin - For eksempel å sette description på interfacene på en switch - da bruker man en loop.

La oss si at vi har en liste med interface navn:
```
interfaces:
  - GigabitEthernet0/0
  - GigabitEthernet0/1
  - GigabitEthernet0/2
  - Vlan1
```
Så kan vi lage en playbook lik denne:
```
---
- name: Set description on all physical interfaces
  hosts: all
  gather_facts: no

  tasks:
    - name: Apply description to all physical interfaces
      cisco.ios.ios_interface:
        name: "{{ item }}"
        description: "Configured by Ansible"
      loop: "{{ interfaces }}"
      when: item is search('GigabitEthernet*|FastEthernet*|TenGigabitEthernet*')
```
Loop: linjen i scriptet vil la ansible loope igjennom interfaces variabelen, som er en liste med interface navn og utføre det tasken er satt opp til, som er å sette description til "Configured by Ansible". Vi kan bruke variabelen 'item' til å referere til hver oppføring i listen, litt som i python ´for item in interfaces:´
when: linjen avgjør om vi skal utføre endringen på akkurat denne oppføringen. I dette tilfellet vil ikke 'Vlan1' bli satt description på.



[Greie ting å kunne om Ansible](README3.md)