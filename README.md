**Velkommen til juleverksted med Ansible og ISE**

Vi kan møte på mange problemer når vi skal installere ansible på en lokal maskin. Vi er her for å ha det gøy, så vi installerer Docker istedet og bygger et container som kjører Ansible. Her er hvordan vi gjør det:

1: Installere Git:
Gå til [https://git-scm.com/install/](https://git-scm.com/install/) og last ned git for ditt operativsystem.

2: Installere Docker Desktop

Hvis du ikke har Docker Desktop installert, gå til [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/), velg Download Docker Desktop, velg versjonen som passer for din maskin.

3: Bygge Docker image med Ansible

Vi trenger koden som ligger i Github repoet her. 
Velg den grønne knappen det står Code på nesten øverst, klikk på nedtrekksboksen og kopier linken.
Åpne et kommandolinjevindu på maskinen din, finn en grei plass å jobbe fra og skriv 'git clone < linken du kopierte fra github >' Gå inn i 'juleverksted' katalogen i kommandolinjevinduet og skriv 'docker build -t ansible-image .' Husk punktumet på slutten. Det kommer en del tekst mens docker bygger det vi trenger, men til slutt kommer vi tilbake til kommandolinjen.

4: Kjøre ansible script
Når docker imaget er bygget, må vi kjøre det.
Avhengig av hvilket operativsystem du har, bruker vi ulike filer for å kjøre det: I MacOS og linux: bruk run-ansible.sh. I Windows, bruk run-ansible.bat eller run-ansible.ps1, hvis du liker powershell. Hvis du er mac eller linux bruker, husk å sette run-ansible.sh til å være eksekverbart.

run-ansible scriptet vil gjøre følgende:
Opprette en container
Mappe opp katalogen du står i til en katalog i containeren.
Kjøre ansible med de parametrene du gir til run-ansible scriptet
Når scriptet er ferdig, avslutte og slette containeren. Det vil se ut som om du kjører ansible lokalt på maskinen din, alle filer leses og skrives til katalogen du står i.

Prøv nå:
'./run-ansible.sh -i inventory playbook.yml'

Hva forteller vi til ansible? Inventory filen inneholder en liste over maskiner og hvordan vi skal koble oss til dem. Denne filen inneholder bare localhost. Mer om dette senere.

Playbooken skriver 'hello world' til skjermen. 
Litt om formatet til en playbook:
Øverst står det hosts: - Dette er hvilke av maskinene som ligger i inventory filen vår vi skal kjøre mot.
gather_facts: Som standard vil Ansible samle inn litt informasjon om maskinen den kommunisere med, som os versjon, minne osv. Ved å si gather_facts:no sier vi at Ansible kan hoppe over det.





