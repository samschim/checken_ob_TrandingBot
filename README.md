# TradingBot
#TradingBot #SmoliTrade #Smolit
___
https://github.com/SamSchim/TradingBot/blob/main/%23%20TradingBot_PRE-SALE.md     <-- PRE-SALE TradingBot
___


TradingBot is a Raspberry PI, configed with SmoliTradeOS and many more greate open source trading tools

# Das Projekt
Der TradingBot besteht im wesentlichen aus drei TradingBot Software Komponenten, sowie den Hardware Komponenten.
Der Bot muss nur mit dem Wlan verbunden und an den Strom angeschlossen werden.
Der Zugriff erfolgt über eine Web-UI im Browser oder über die App.
Der Bot ist so konfigiriert, das er regelmäßige Updates automatisch installiert. Bei den Updates handelt es sich um neue Software Updates, neue Strategien und Konfigurationen.
Alle Infos zu den Updates sowie der Source Code können im Github Repository nachgelesen werden.

## Software:

### SmolitTrade
SmolitTrade ist eine von mir entwickeltes open source Framework. 
Es umfasst verschiedene praktische Software Tools zur Automatisierung und Integration von Freqtrade und OctoBot in das Framework, einen weiteren Bot der FreqTrade und OctoBot administriert sowie ein NL-Netzwerk mit verschiedenen ML- und DL-Algorithmen. Zudem bietet SmoliTrade eine nutzerfreundliche GUI mit der best practise workflows automatisert und in wenigen Schritten ausgeführt werden können.

MEHR ZU DEM PROJEKT UNTER https://github.com/SamSchim/SmoliTradeOS

### Freqtrade
Freqtrade ist ein TradinBot. Die Software ist open source und in Python geschrieben. 
Das ermöglicht dem Nutzer die Software selber zu konfigurieren und an eigene Bedürfnisse anzupassen. Die verwendeten Trading Strategien werden in einem Python Script definiert. Zusätzliche Optionen werden in einem Configuration File in Json Format gespeichert.
Der Bot wird auf lokaler Hardware installiert und ist über eine Web-UI, eine Android App und via Telegram Bot zu bedienen. 
Konfigurationen und Strategien werden vorher auf "Code-Ebene", also in einem Editor vorgenommen.
Freqtrade bietet die möglichkeit, die Konfigurationen von einem ML-Algorithmus vornehmen zu lassen. Das Tool heißt HyperOpt.

### OctoBot
OctoBot ist ein TradinBot. Das Projekt ist ebenfalls open source, bietet aber zusätzliche paid-services an. Dazu gehören eine Cloud für die Bots und viele weitere interessante möglichkeiten.
OctoBot zeichnet sich durch die einfachheit und Benutzerfreundlichkeit aus. Alle Funktionen lassen sich direkt über die Web-UI einstellen. Zudem bietet OctoBot die möglichkeit LLMs über API in die Strategien einzubinden.
(Eine Einschränkung im Vergleich zu Freqtrade sind die Beschränkungen der Web-UI. Die Strategien lassen sich nicht so flexibel programmieren.)-> RECHERCHE OB RICHTIG!


## Hardware:

### Der Mini PC
Verwendet wird ein Raspberry PI 4 mit 8GB RAM. Der mini PC ist sehr Strom sparend und bietet genügend Leistung für den TradingBot. Zudem ist der Raspi mit ca. 120€ kosten günstig in der Anschaffung.
Der Raspi kann auf Wunsch und gegen Aufpreis mit unterschiedlichen Display konfiguriert werden. 


