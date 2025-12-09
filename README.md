**Velkommen til juleverksted med Ansible og ISE**

Vi kan møte på mange problemer når vi skal installere ansible på en lokal maskin. Vi er her for å ha det gøy, så vi installerer Docker istedet og bygger et container som kjører Ansible. Her er hvordan vi gjør det:

Aller først: Mange bruker vscode til å redigere filer. Du finner det her: [https://code.visualstudio.com/download](https://code.visualstudio.com/download) hvis du ikke har det fra før av. Du kan selvfølgelig bruke den IDE'en du liker best.

Har du git på maskinen din? Hvis ikke, installer Git også:
Gå til [https://git-scm.com/install/](https://git-scm.com/install/) og last ned git for ditt operativsystem.

1: Installere Docker Desktop

Hvis du ikke har Docker Desktop installert, gå til [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/), velg Download Docker Desktop, velg versjonen som passer for din maskin. 

2: Bygge Docker image med Ansible

Vi trenger koden som ligger i Github repoet her. 
Velg den grønne knappen det står Code på nesten øverst, klikk på nedtrekksboksen og kopier lenken.

Åpne et kommandolinjevindu på maskinen din, finn en grei plass å jobbe fra og skriv `git clone < linken du kopierte fra github > ` Gå inn i 'juleverksted' katalogen i kommandolinjevinduet og skriv `docker build -t ansible-image .` Husk punktumet på slutten. Det kommer en del tekst mens docker bygger det vi trenger, men til slutt kommer vi tilbake til kommandolinjen.

3: Kjøre ansible script
Når docker imaget er bygget, må vi kjøre det.
Avhengig av hvilket operativsystem du har, bruker vi ulike filer for å kjøre det: I MacOS og linux: bruk `run-ansible.sh`. I Windows, bruk `run-ansible.bat` eller `run-ansible.ps1`, hvis du liker powershell best. Hvis du er mac eller linux bruker, husk å sette run-ansible.sh til å være eksekverbart.

Run-ansible scriptet vil gjøre følgende:
Opprette en container
Mappe opp katalogen du står i til en katalog i containeren.
Kjøre ansible med de parametrene du gir til run-ansible scriptet
Når scriptet er ferdig, avslutte og slette containeren. Det vil se ut som om du kjører ansible lokalt på maskinen din, alle filer leses og skrives til katalogen du står i.
Hvis du følger med i Docker Desktop applikasjonen, vil du se en kontainer bli opprettet og slettet kjapt.

Åpne aller først playbook.yml filen i editoren din (VSCode eller annet), se på strukturen, prøv så å kjøre den med kommandoen `./run-ansible.sh -i inventory playbook.yml`


Hva forteller vi til ansible med denne kommandoen? -I forteller ansible hvilken fil den skal bruke som Inventory. Inventory filen inneholder en liste over maskiner og hvordan vi skal koble oss til dem. Filen som ligger her inneholder bare localhost. Mer om dette senere.

Playbooken vi har skriver 'hello world' til skjermen. 
Litt om formatet til en playbook:
Øverst står det hosts: - Dette er hvilke av maskinene som ligger i inventory filen vår vi skal kjøre mot.
gather_facts: Som standard vil Ansible samle inn litt informasjon om maskinen den kommunisere med, som os versjon, minne osv., som vi kan bruke senere i scriptet vårt. Ved å legge til en linje med  `gather_facts:no`, sier vi at Ansible kan hoppe over det, da går ting litt fortere.

Hva ser vi?

```
PLAY [all] *****************************************************************************************************************

TASK [Print a message] *****************************************************************************************************
<span style="color: green;">ok: [localhost] => {
    "msg": "”Hello world!\""
}
</span>
PLAY RECAP *****************************************************************************************************************
<span style="color: green;">olocalhost                  : ok=1 </span>   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```
Øverst kommer en linje som oppsummerer hvilke maskiner vi kjører mot,
så kommer de ulike taskene. Vi kjenner igjen navnet 'Print a message' fra playbook.yml filen. Hadde vi hatt flere tasks, hadde de kommet under hverandre her. Til slutt får vi en oppsummering der vi ser om tasken har gått bra eller ikke og noen andre mulige resultat.





