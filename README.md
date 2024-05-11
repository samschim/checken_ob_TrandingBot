# TradingBot
#TradingBot #SmoliTrade #Smolit
___
https://github.com/SamSchim/TradingBot/blob/main/%23%20TradingBot_PRE-SALE.md     <-- PRE-SALE TradingBot
___


TradingBot is a Raspberry PI, configed with SmoliTradeOS and many more greate open source trading tools

# Das Projekt
Der TradingBot besteht im wesentlichen aus drei TradingBot Software Komponenten, sowie den Hardware Komponenten.
Der Bot muss nur mit dem lokalen Wlan verbunden und über das Netzteil mit Strom versorgt werden.

Der Zugriff erfolgt über eine Web-UI im Browser oder über die Desktop-/moblile App.

Der Bot ist so konfigiriert, das er regelmäßige Updates automatisch installiert. Bei den Updates handelt es sich um neue Software Updates, neue Strategien und Konfigurationen.

Ziel des Projektes ist es, ein **all-inclusiv** Environment zu schaffen, das es dem Nutzer ermöglicht komplizierte und Zeit intensive trading Prozesse übersichtlich und schnell zu verwalten. Der TradingBot ist ein einfacher Einstieg in die Crypto Welt und bietet erfahrenen Crypto Usern die Möglichkeit Prozesse zu automatisieren. Source Code, Strategien und weitere Infos werden in diesem Repository veröffentlicht.

Alle Infos zu den Updates sowie der Source Code können in dem Projekt Repository nachgelesen werden.

## Software:

### SmolitTrade
SmolitTrade ist im wesentlichen ein open source Framework. 
Das Framework besteht aus diversen Trading-, Chart- und Banking- Software Tools. SmoliTrade beinhaltet unter anderem open source trading Bots wie Freqtrade und OctoBot, weitere Bots die unteranderem FreqTrade und OctoBot administrieren, sowie ein NL-Netzwerk mit verschiedenen ML- und DL-Algorithmen. 

Zudem bietet SmoliTrade eine nutzerfreundliche GUI mit der best-practise-workflows automatisert und in wenigen Schritten ausgeführt werden können. Dazu gehört:

- Management durch API integration aller Exchange Accounts
- Management durch API integration aller Wallets
- Transaction automations
- Listing der Portfolios von den unterschiedlichen Exchange Börsen und Wallets
- Chart mit Kurs unterschiede der Börsen
- ... und vieles mehr ...

MEHR ZU DEM PROJEKT UNTER https://github.com/SamSchim/SmoliTradeOS

### Freqtrade
Freqtrade ist ein TradingBot in Python geschrieben. Die Software ist open source und mit  GPL-3.0 license  lizensiert. 

Die Software ermöglicht dem Nutzer die Freqtrade Bots selbst zu konfigurieren und an eigene Bedürfnisse anzupassen. Die verwendeten Trading Strategien werden in einem Python Script definiert. Zusätzliche Optionen werden in einem Configuration File in Json Format gespeichert.
Der Bot wird auf lokaler Hardware installiert und ist über eine Web-UI, eine Android App und via Telegram Bot zu bedienen. 
Konfigurationen und Strategien werden vorher auf "Code-Ebene", also in einem Editor vorgenommen.
Freqtrade bietet die möglichkeit, die Konfigurationen von einem ML-Algorithmus vornehmen zu lassen. Das Tool heißt HyperOpt.

MEHR ZU DEM PROJEKT UNTER https://github.com/freqtrade/freqtrade

### OctoBot
OctoBot ist ein TradingBot. Das Projekt ist ebenfalls mit lizensierte GPL-3.0 license open source Software, bietet aber zusätzliche paid-services an. 

Dazu gehören eine Cloud für die Bots und viele weitere interessante möglichkeiten.
OctoBot zeichnet sich durch die einfachheit und Benutzerfreundlichkeit aus. Alle Funktionen lassen sich direkt über die Web-UI einstellen. Zudem bietet OctoBot die möglichkeit LLMs über API in die Strategien einzubinden.

MEHR ZU DEM PROJEKT UNTER https://github.com/Drakkar-Software/OctoBot

## Hardware:

### Der lokale TradinBot
Verwendet wird ein Raspberry PI 4 mit 8GB RAM. Der mini PC ist sehr Strom sparend und bietet genügend Leistung für den TradingBot. Zudem ist der Raspi mit ca. 120€ kosten günstig in der Anschaffung.
Der Raspi kann auf Wunsch und gegen Aufpreis mit unterschiedlichen Display konfiguriert werden. 


