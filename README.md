![Ansible on ISE](img/juleverksted.png)

**Velkommen til juleverksted med Ansible og ISE**

Vi kan møte på mange problemer når vi skal installere ansible på en lokal maskin. Vi er her for å ha det gøy, så vi installerer Docker istedet og bygger en container som kjører Ansible. Her er hvordan vi gjør det:

Aller først: Mange bruker vscode til å redigere filer. Du finner det her: [https://code.visualstudio.com/download](https://code.visualstudio.com/download) hvis du ikke har det fra før av. Du kan selvfølgelig bruke den IDE'en du liker best.

Har du git på maskinen din? Hvis ikke, installer Git også:
Gå til [https://git-scm.com/install/](https://git-scm.com/install/) og last ned git for ditt operativsystem.

## Installere Docker Desktop

Hvis du ikke har Docker Desktop installert, gå til [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/), velg Download Docker Desktop, velg versjonen som passer for din maskin. 

## Bygge Docker image med Ansible

Vi trenger koden som ligger i Github repoet her. 
Finn den grønne knappen det står Code på nesten øverst på denne siden, klikk på nedtrekksboksen og kopier lenken.

Åpne et kommandolinjevindu på maskinen din, finn en grei plass å jobbe fra og skriv `git clone <linken du kopierte fra github> ` 
Når den har lastet ned, gå inn i 'juleverksted' katalogen i kommandolinjevinduet og skriv `docker build -t ansible-image .` - Husk punktumet på slutten. 
Det kommer en del tekst mens docker bygger det vi trenger, men til slutt kommer vi tilbake til kommandolinjen.


Nå er vi er klare for å [teste docker imaget vårt](Docs/README1.md)
