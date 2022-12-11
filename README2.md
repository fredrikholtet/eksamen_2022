
######################################


Alle oppgavene er svart på under, det er lastet opp som pdf fordi bla bla. 

### DEL 1 devops


1. Problemet med dagens systemutviklingsprosess er så mangt, og det avhenger veldig på hva
   slags størrelse og retningslinjer bedriften har. Som fek. Hvor det er snakk om store
   organisasjoner som sitter på egne team som jobber kun med test. Disse tester systemet og
   applikasjonene manuelt, eller delvis manuelt med hjelp fra verktøy, som kan føre til
   «Waste». Her kan det oppstå et rom hvor man ikke får levert før man har fått testet ut
   løsningen. Disse problemene kan løses med å innføre automatiserte tester, og man kan
   kanskje flytte flere av testerne over til utviklings teamet. Om man utvikler gode verktøy for
   testing kan man utføre en mer effektiv jobb med tanke på en god flyt.
2. en vanlig respons på feil under release av funksjonalitet er å gjøre det mindre hyppig.
   Det er mange problemer med dette, når en utvikler får en kjempestor task og ikke kommer
   noen vei med oppgaven, og alle på teamet ser på Jira bordet at tasken du jobber på ikke
   flytter seg eller kommer noen feil, kan dette føre til mindre selvtillit, dårlig motivasjon og
   mister flyten.
   Tilnærming: Det er mange tilnærminger på hvordan forbedre dette, som regel så kan
   redusering av oppgave størrelse bidra til mere oversikt og hyppigere levering av kode
   (Singel-Pice Flow) og det er lettere og kunne finn ut hvor feilen skjedde før det kommer til
   Prod. Et vell fungerende Software team jobber på den måten hvor man får en mindre task i
   jira-bordet som forsvinner i høy hastighet fra uferdig til ready-for-prod på kort tid og
   utvikleren får en mestringsfølelse og man slipper flaskehals i prosessen. Om man får en stor
   task, kan man heller dele opp oppgaven i mindre størrelsers og gjøre «en ting av gangen»
3. Det at teamet overleverer kode til drift avdelingen kan føre til flere utfordringer.
   Uten god planlegging kan det ført føre til venting på andre features når man skal legge til
   nye ting, om de er avhengig av hverandre. Om det skulle oppstå en feil eller at personen ikke
   forstår hvordan jeg har utført arbeidet etter at koden er levert til drift og det ikke er skrevet
   god nok dokumentasjon er man nødt til å skape et avbrudd, og man er nødt kontakte
   utvikleren fra forrige ledd for å få tak i den informasjonen man trenger. De gevinstene kan
   man få ved at team har ansvar for både drift og utvikling, er at man kan kutte i ledd og
   avbrudd om det er snakk om flere prosesser og flyten blir bedre og selve effektiviteten i
   bedriften vil bli mye mer optimalisert.
   La oss si at jeg er en fullstack, da slipper jeg å snakke med front-end og vente på at han skal
   avlevere sin kode, og jeg kan lage denne funksjonen selv og jeg slipper enda en overlevering.
4. release koden ofte er kan by på noen utfordringer, som jeg nevnte tidligere hvis det oppstår
   flere feil under realse kan det føre til at bedriften velger å la utvikleren release koden
   sjeldnere. Hvis man har et team som er motivert og en høy frekvens hvor kode blir levert
   hyppig, kan det bygge opp seg et press bakfra når det kommer commits hyppig.
   Man kan alltids måle hvordan bedriften «ligger an» for å kartlegge hvor problemene
   oppstår, og man kan følge noen prinsipper for å måle dette og fjerne/ redusere risiko i en
   bedrift.Det er flere måter å redusere eller fjerne risiko, men i en bedrift kan man fek måle,
   Depolyment frekvens, LeedTime, Change fail rate, og MTTR da kan man måle flowen til
   bedriften og optimalisere hvordan bedriften ligger an.

################

# Del 2 - CI

# Denne filen inneholder alle svar fra oppgaver fra del 2.


Oppgave1.

Starter med å endre ci.yml workflow fordi jeg vil ha den til å kjøres automatisk ved push til main.
Ser at den feiler fordi det er feil i enhetstesten.

![workflow0 1](https://user-images.githubusercontent.com/69800718/206912953-49137e15-54b1-4135-b4fb-6e5c3f76c1fb.png)



Oppgave2.

Deretter endrer jeg testen til å kjøre grønt siden testen skal asserte 0, siden Cart er tom. Pusher til
main for å se at det kjøres hver gang det blir gjort et push og ser at workflows er oppe og går.

![workflow1](https://user-images.githubusercontent.com/69800718/206912982-45fc88cf-9073-492a-bba0-f54af29f2294.png)



Sjekker at workflowen skal kompilere javakoden og kjører enhetstester på hver eneste push,
uavhengig av branch


![branch1](https://user-images.githubusercontent.com/69800718/206913018-28a24dce-9f64-4d9f-8b6b-b569bc21e896.png)




Oppgave 3.


Hei, sensor. For å kontroll på «Branch protection og status sjekker» går man i

-  Settings -> Branches -> Add Branch protection rule 
-  Setter branch main pattern til main 
-  Require a pull request before merging 
-  Require status check to pass before merging 
-  Do not allow bypassing the above settings 


Ingen kan pushe kode direkte på main branch, Nå kan vi ikke Merge en pull request inn i main uten
at status sjekker i order. Det betyr at vår Workflow har kjørt OK.



# Del 3 - Docker

Oppgave 1)


Her gikk jeg til Amazon ECR, og opprettet et nytt repo i å høre hjørnet og ga det en unike id.
Jeg gikk inn i koden og endret docker.yml og dockerfilen, dette var fordi jeg har lyst til at docker
skulle bygge hver gang jeg gjør en push mot GitHub for å se at workflows kjører grønt og at det ikke
er noe problemet. Jeg endret. yml fila og siden jeg hadde en push tag som kjørte hver gang jeg
pushet så kunne jeg se hvordan programmet oppførte seg. Jeg la til Secrets i koden og opprettet det
i Github og lagret secrets på et sted som ingen noen gang får tak i det. Jeg innser nå at hver gang jeg
pushet bruker det opp tiden, og jeg burde lagt til en 
  - build:
     - Script: blabla
     - Timeout: 1minute

Her er en liten bit av hva jeg la til for at det skulle fungere og disse endringene er i .guthub katalogen ->  docker.yml fila , 

![run-config](https://user-images.githubusercontent.com/69800718/206913067-72a7fb73-0d31-4ea9-9e55-b62e6abdc818.png)


etter dette bygde jeg en container slik ,
- docker build . --tag <give the image a name>
- docker run <image tag used above>
- Også bare prøvde jeg meg frem og feilsøkte og så at det fungerte som det skulle.

jeg la også til kode i Docker i rotkatalogen, men den er lik for alle.



## oppgave 3) del 3

**Beskriv deretter med egne ord hva sensor må gjøre for å få sin fork til å laste opp container image
til sitt eget ECR repo**


Fork repoet, gå til
   - settings -> secrets og new repository secrets
   - Repo_name – navnet til aws ECR repoet du lagde
   - Opprett egne secrets, da går man til aws og finner IAM finnr Security credentials
   - Trykker på Create access Key, og lager Access key og secret access key og lagrer dem slik at man ikke mister dem, og viktig at de er sikkre.
   - Gå i workflows og endre Run config, hvor Sensor må endre docker tag som vist nedenfor, og måfjerne <>

- docker tag hello 244530008913.dkr.ecr.eu-west-1.amazonaws.com/<insert sensor bruker>:$rev

- docker push 244530008913.dkr.ecr.eu-west-1.amazonaws.com//<insert sensor bruker>:$rev

Da skal vi Få GitHub Actions til å bygge & pushe et nytt Image hver gang noen lager en ny commit på
main branch

Push et container image til dit ECR repository
- docker build -t <ditt tagnavn> .
- docker tag <ditt tagnavn> 244530008913.dkr.ecr.eu-west-1.amazonaws.com/<ditt ECR repo navn>
- docker push 244530008913.dkr.ecr.eu-west-1.amazonaws.com/<ditt ECR repo navn>


## DEl 5) 

Oppgave 1) 

Jeg støttet på den feilen med bucket already owned by you, dette betyr at det er oprettet en buvket
tidligere på en annen måte med en terraform konfigurasjon, så det jeg gjorde var å endre
konfigurasjonen til at det skulle bruke brukte min bucket som kilde. Hvilken rettelse som er riktig for
miljøet ditt vil være spesifikt for hva du prøver å oppnå i Terraform-konfigurasjonen.
Jeg mener at Terraform forventer bare en kilde til sannheter for å kunne administere enkelte
infrastruktur. Selv om du teknisk sett importere terraform ressurs på mange steder, men den kan
komme konflikt med hverandre hvis det er forskjeller.
