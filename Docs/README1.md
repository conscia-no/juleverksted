## Kjøre ansible script

Når docker imaget er bygget, må vi kjøre det.
Avhengig av hvilket operativsystem du har, bruker vi ulike filer for å kjøre det: I MacOS og linux: bruk `run-ansible.sh`. I Windows, bruk `run-ansible.bat` eller `run-ansible.ps1`, hvis du liker powershell best. Hvis du er mac eller linux bruker, husk å sette run-ansible.sh til å være eksekverbart.

Run-ansible scriptet vil gjøre følgende:
Opprette en container
Mappe opp katalogen du står i til en katalog i containeren.
Kjøre ansible-playbook med de parametrene du gir til run-ansible scriptet.
Når scriptet er ferdig, avsluttes og slettes containeren og for deg vil se ut som om du kjører ansible lokalt på maskinen din, alle filer leses og skrives til katalogen du står i.
Hvis du følger med i Docker Desktop applikasjonen, vil du se en kontainer bli opprettet og slettet kjapt.

## Vår første playbook

Åpne aller først playbook.yml filen i editoren din (VSCode eller annet), se på strukturen, prøv så å kjøre den med kommandoen `./run-ansible.sh -i inventory playbook.yml` Bruk selvfølgelig run-ansible.bat eller .ps1 versjonen hvis du trenger det


Hva forteller vi til ansible med denne kommandoen? -I forteller ansible hvilken fil den skal bruke som Inventory. Inventory filen inneholder en liste over maskiner og hvordan vi skal koble oss til dem. Filen som ligger her inneholder bare localhost. Mer om dette senere.

Når vi kjører kommandoen over, skriver ansible 'hello world' til skjermen, på sin måte.

Litt om formatet til en playbook:
Øverst står det hosts: - Dette er hvilke av maskinene som ligger i inventory filen vår vi skal kjøre mot.
gather_facts: Som standard vil Ansible samle inn litt informasjon om maskinen den kommunisere med, som os versjon, minne osv., som vi kan bruke senere i scriptet vårt. Ved å legge til en linje med  `gather_facts:no`, sier vi at Ansible kan hoppe over det, da går ting litt fortere.
Så kommer en rekke med tasks, selv om vi bare har en her.

Hva ser vi når playbooken kjører?

```
PLAY [all] *****************************************************************************************************************

TASK [Print a message] *****************************************************************************************************
ok: [localhost] => {
    "msg": "”Hello world!\""
}

PLAY RECAP *****************************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```
Øverst kommer en linje som oppsummerer hvilke maskiner vi kjører mot,
så kommer de ulike taskene. Vi kjenner igjen navnet 'Print a message' fra playbook.yml filen. Hadde vi hatt flere tasks, hadde de kommet under hverandre her. Til slutt får vi en oppsummering der vi ser om tasken har gått bra eller ikke og noen andre mulige resultat.

La oss lese [litt mer om ansible](README2.md)

