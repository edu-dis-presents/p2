---
layout: section
---

## Приклади розподілених інформаційних систем


---

[PRO ET CONTRA](http://open-wdc-dev.herokuapp.com/design/proEtContra%20v.2.0)

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:80%"
>

@startuml

    package "Аналітична платформа" {
        node  apps[
            <<ресурс>>
        
            ----
            
            Сервіс управління
            веб-застосунками
            OPEN-WDC-DEV
        ]
        
        node  dps[
            <<ресурс>>
            
            ----
            
            Сервіс оброблення
            даних
            OPEN-WDC-DPS
        ]
        
        node  robusta[
            <<ресурс>>
            
            ----
            
            Сервіс збору
            та аналізу даних
            з медіа-джерел
            ROBUSTA
        ]
        
        node  jacetext[
            <<ресурс>>
            
            ----
            
            Сервіс оброблення
            текстів природньої мови
            JACE-TEXT
        ]
        
        node  jacenerru[
            <<ресурс>>
            
            ----
            
            Сервіс розпізнавання
            іменованих сутностей
            для російської мови
            JACE-NER-RU
        ]
        
        node  jaceneruk[
            <<ресурс>>
            
            ----
            
            Сервіс розпізнавання
            іменованих сутностей
            для української мови
            JACE-NER-UK
        ]
        
        node  jaceneren[
            <<ресурс>>
            
            ----
            
            Сервіс розпізнавання
            іменованих сутностей
            для англійської мови
            JACE-NER-EN
        ]

    }
    
    node  client  [
        <<користувач>>
        
        ----
        
        Веб-застосунок
        PRO ET CONTRA
    ]

    
    node  wikien  [
        <<ресурс>>
        
        ----
        
        en.wikipedia.org/w/api.php
    ]
    
    node  wikiru  [
        <<ресурс>>
        
        ----
        
        ru.wikipedia.org/w/api.php
    ]
    node  wikiuk  [
        <<ресурс>>
        
        ----
        
        uk.wikipedia.org/w/api.php
    ]
    
    client - apps
    client -- dps
    dps -u- wikien
    dps -u- wikiru
    dps -u- wikiuk
    
    
    jacetext -- jacenerru
    jacetext -- jaceneruk
    jacetext -- jaceneren
    dps -l- jacetext
    dps - robusta
    
    
@enduml

</center>


---

[PRO ET CONTRA](http://open-wdc-dev.herokuapp.com/design/proEtContra%20v.2.0)

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:50%"
>

@startuml

actor User
boundary SPA
control "SPA Host" as SPAHOST  
control "Data Processing Service" as DPS
control Robusta
control "Media Sources" as MS 

ref over SPA, SPAHOST, DPS, Robusta 
WDC IT INFRASTRUCTURE
end ref
Robusta -> MS
MS -> Robusta
...
User -> SPAHOST : Access to application
SPAHOST -> SPA **: "Activate application"
SPA -> User: UI
User -> SPA: Query
SPA -> DPS: Data Processing Script (query)
DPS -> Robusta: Query (all messages)
Robusta -> DPS: Result
DPS -> Robusta: Query (negative messages)
Robusta -> DPS: Result
DPS -> Robusta: Query (positive messages)
Robusta -> DPS: Result
DPS -> DPS: Data processing
DPS -> SPA: Result
SPA -> User: Visualiation
@enduml

</center>



---

[DATA FRESH on COVID-19](http://open-wdc-dev.herokuapp.com/design/data-fresh)

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:70%"
>

@startuml

    package "Аналітична платформа" {
        node  apps[
            <<ресурс>>
        
            ----
            
            Сервіс управління
            веб-застосунками
            OPEN-WDC-DEV
        ]
        
        node  dps[
            <<ресурс>>
            
            ----
            
            Сервіс оброблення
            даних
            OPEN-WDC-DPS
        ]
        
        

    }
    
    node  client  [
        <<користувач>>
        
        ----
        
        Веб-застосунок
        DATA FRESH ON COVID-19
    ]

    
    node  github  [
        <<ресурс>>
        
        ----
        
        GITHUB
    ]
    
    node  rnbo  [
        <<ресурс>>
        
        ----
        
        https://health-security.rnbo.gov.ua/api/
    ]
    database  d1  [
        <<ресурс>>
        
        ----
        
        Atlas MongoDB
        Сховище наборів даних
    ]
    
    client -u- apps
    client -u- dps
    dps -u- rnbo
    dps -u- github
    dps -u- d1
    
    
    
@enduml

</center>

---

[Crimea Water Resources](http://open-wdc-dev.herokuapp.com/design/Crimea-water)

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:70%"
>

@startuml

    package "Аналітична платформа" {
        node  apps[
            <<ресурс>>
        
            ----
            
            Сервіс управління
            веб-застосунками
            OPEN-WDC-DEV
        ]
        
        node  dps[
            <<ресурс>>
            
            ----
            
            Сервіс оброблення
            даних
            OPEN-WDC-DPS
        ]
        
        node  cdms[
            <<ресурс>>
            
            ----
            
            Сервіс відстежування змін
            OPEN-WDC-CDMS
        ]
        

    }
    
    node  client  [
        <<користувач>>
        
        ----
        
        Веб-застосунок
        CRIMEA WATER RESOURCES
    ]

    
    node  sentinel  [
        <<ресурс>>
        
        ----
        
        SENTINEL HUB
    ]
    
    
    database  d1  [
        <<ресурс>>
        
        ----
        
        Atlas MongoDB
        Сховище даних моніторингу
    ]
    
    client -u- apps
    client -u- dps
    cdms -u- sentinel
    cdms -u- d1
    cdms -l- dps
    
    
@enduml

</center>

---
layout: two-cols
---

MOLFAR 

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:95%"
>

@startuml


queue IQ1 <<AMQP Queue>> as "Input Queue 1.1"
queue IQ2 <<AMQP Queue>> as "Input Queue 1.n"

component instance1 <<service instance>> as "MS Instance 1"
component E <<AMQP Exchange>> as "Output Exchange 1"

queue IQ3 <<AMQP Queue>> as "Input Queue 2.1"
component instance2 <<service instance>>  as "MS Instance 2"
component E2 <<AMQP Exchange>> as "Output Exchange 2"


IQ1 --# instance1
IQ2 --# instance1
instance1 #-> E
E - IQ3
IQ3 --# instance2

instance2 #-> E2

queue IQ4 <<AMQP Queue>> as "Input Queue 3.1"
component instance3 <<service instance>>  as "MS Instance 3"
component E3 <<AMQP Exchange>> as "Output Exchange 3"

E -- IQ4
IQ4 --# instance3

instance3 #-> E3


@enduml

</center>


<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    margin-top: 20px;
    width:75%"
>

@startuml


component E <<AMQP Exchange>> as "Output Exchange 1"

queue IQ3 <<AMQP Queue>> as "Task Queue"
component instance2 <<service instance>>  as "MS Instance 1"
component E2 <<AMQP Exchange>> as "Output Exchange 2"


E - IQ3
IQ3 -# instance2

instance2 #--> E2

component instance3 <<service instance>>  as "MS Instance 2"

IQ3 --# instance3

instance3 #-> E2


@enduml

</center>



::right::

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:65%"
>

@startuml

node "Node" {
    component RSS_MS_C <<service>> as "MS Container"
    component RSSI <<service>> as "MS Instances"
    RSS_MS_C -> RSSI
}

interface MSC <<RPC>> as "MS Instances\nControl API"

RSS_MS_C #-- MSC


node "MS Registry" {
    component WC as "Workflow Controller"
    component MSM as "MS Monitor"
    database MSDB as "Storage"
    WC -- MSDB
    MSDB - MSM
}

MSC )--# WC

node {
    component EB as "Message broker" {
        component MSHQ  <<AMQP Exchange>> as "MS Health"
    }
}    

RSS_MS_C #--> MSHQ
RSSI #--> MSHQ
MSHQ --# MSM

node Computer {
    node Browser {
        component SPA as "Workflow\nManagement\nApp"
    }
}





interface WMAPI <<RESTfull>> as "Workflow\nManagement\n API"
interface IMAPI <<RESTfull>> as "Instances\nMonitoring\n API"

WC -r- WMAPI
MSM -- IMAPI



WMAPI )--- SPA
IMAPI )- SPA

@enduml


</center>


---
layout: two-cols
---

MOLFAR  

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:95%"
>

@startuml

package "NL Processing" {

    component NL <<service instance>> as "Language Detection"
    
    component S1 <<service instance>> as "Sentiment\nAnalysis\n(en)"
    component S2 <<service instance>> as "Sentiment\nAnalysis\n(uk)"
    component S3 <<service instance>> as "Sentiment\nAnalysis\n(ru)"
    
    component N1 <<service instance>> as "NER (en)"
    component N2 <<service instance>> as "NER (uk)"
    component N3 <<service instance>> as "NER (ru)"
    
    component C <<service instance>> as "Composer"
    
    NL --> S1
    NL --> S2
    NL --> S3
    NL --> N1
    NL --> N2
    NL --> N3
    
    S1 --> C
    S2 --> C
    S3 --> C
    N1 --> C
    N2 --> C
    N3 --> C
    
}

@enduml
</center>


::right::

<center style="
    border-radius:4px;
    border: 1px solid #cfd7e6;
    box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025);
    padding: 0.5em;
    width:95%"
>

@startuml

database DB as "Source\nDatabase"
component SCH <<service instance>> as "Scheduler"
component SC <<service instance>> as "Source Scraper"

component PP <<service instance>> as "Message Preprocessor"

component NL <<service instance>> as "NL Processor"
component KD <<service instance>> as "Keywords Detector" #ffab91
component SKC <<service instance>> as "Source Keyword\nComposer" #ffab91

component SF <<service instance>> as "Source Filter"



DB -l- SCH
SCH --> SC
SC --> PP
PP --> NL
PP -> KD
KD -u->SKC
SKC -u- DB
SF -l- DB

@enduml

</center>

