
## Grupper

Inventory filen vår inneholder endepunktene vi skal kommunisere mot, men av og til vil vi ikke kjøre et script mot alle endepunktene. Vi kan da bruke grupper.
En gruppe består av like endepunkt, som f.eks edge switcher, som skal ha samme konfigurasjon.
Du kan kjøre paybooks mot en gruppe, gi variabler til en gruppe (Mer om det under) og bruke grupper til å lage nye grupper.

Eksempel på en inventory.yml fil med grupper:
```
all:
  children:
    switches:
      hosts:
        switch1:
          ansible_host: 10.11.0.10
          ansible_network_os: cisco.ios.ios
          ansible_connection: network_cli
          ansible_user: admin
          ansible_password: "{{ vault_switch_password }}"
        switch2:
          ansible_host: 10.11.0.11
          ansible_network_os: cisco.ios.ios
          ansible_connection: network_cli
          ansible_user: admin
          ansible_password: "{{ vault_switch_password }}"

```

## Variabler

Variabler kan komme fra mange forskjellige kilder.

Du bruker en variabel ved å sette doble krøllparanteser rundt, på denne måten:

```
- debug:
    msg: "Nginx is running on port {{ nginx_port }}"
```

Du kan definere variable på forskjellige steder:
I inventory filen: (Den du spesifiserer med -I husker du)
I group_vars katalogen: - Dette er en spesiell katalog der Ansible ser etter en yaml fil med navnet på gruppen du jobber med.
I host_vars katalogen: - Dette ligner på group_vars, bare at den ser etter en yaml fil med navnet på hosten(e) du jobber med.
Ifra kommandolinje: Ved å legge til  ```-e variabelnavn=verdi```når du kjører playbooken
Du kan også definere variabler mens scriptet kjører, ved å bruke ```register```nøkkelordet for å kunne bruke output fra en modul i senere moduler. Sjekk dokumentasjonen til variabelen for å se formatet eller lag en debug task for å skrive variabelen til skjermen - sjekk den første playbooken for eksempel.

Vil du vite mer om variabler brenner ChatGPT etter å forklare.

