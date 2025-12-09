## Litt mer om ansible

Det er noen triks som er greie å vite om i Ansible.

### Moduler og Collections

Ansible i seg selv kan ikke så mye, men begynner plugin kode kalt moduler til å snakke med ulike typer utstyr og tjenester. Disse kommmer i samlinger som heter collections, som installeres med kommandoen ```ansible-galaxy install <collection navn> ```` Men hva gjør de? Ta en kikk i [Ansible dokumentasjonen](https://docs.ansible.com/projects/ansible/11/collections/cisco/ise/index.html#plugin-index) og finn ut! Linken går til cisco.ise collection'en, men blar du i menyen til venstre finner du collections for andre ting.

### Dokumentasjon

Ta en kikk på [cisco.ise.endpoint_info](https://docs.ansible.com/projects/ansible/11/collections/cisco/ise/endpoint_info_module.html#ansible-collections-cisco-ise-endpoint-info-module) modulen.

Du finner først et Synopsis kapittel, som forteller hva modulen gjør, så kommer Parameters som viser hvordan man kan tilpasse spørringene, hvilke parametre som er påkrevet osv.
Etter det kommer eksempler på bruk. Til slutt kommer eksempler på hvordan dataene man får tilbake er formatert. Vi er dypt nedi nerdeland her - det er lov å spørre chatgpt nå.

Under Requirements har cisco.ise for øvrig noen krav til ting som skal være installert. Vi har gjort det under byggingen av docker imaget for cisco.ise, men prøver du å gå mot noe annet enn ise, ta en kikk i Dockerfile filen. Du kan se hvor collections blir installert og hvor andre ting blir installert. Gjør du endringer: Kjør build kommandoen på nytt.

### Looper

Ansible er flink til å gjøre de samme tingene på flere maskiner i parallell, men noen ganger skal man gjøre de samme tingene på flere objekter på samme maskin - For eksempel å sette description på interfacene på en switch - da bruker man en loop.