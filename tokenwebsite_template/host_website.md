Um die TradingBot Tokenwebsite auf einem Raspberry Pi zu hosten, folge  bitte dieser detaillierten Schritt-für-Schritt-Anleitung:
Voraussetzungen:

    Raspberry Pi mit Raspberry Pi OS installiert.
    Internetverbindung.
    Zugang zu einem Terminal oder SSH.
    MicroSD-Karte mit ausreichend Speicherplatz (mindestens 8 GB empfohlen).

Schritte:

    Aktualisieren Sie Ihr System
    Öffnen Sie das Terminal und führen Sie die folgenden Befehle aus, um Ihr System zu aktualisieren:

    bash

sudo apt update
sudo apt upgrade -y

Installieren Sie einen Webserver (Nginx)
Installieren Sie Nginx, der als Webserver für Ihre Website dient:

bash

sudo apt install nginx -y

Installieren Sie PHP (optional)
Wenn Ihre Website PHP benötigt:

bash

sudo apt install php-fpm -y

Konfigurieren Sie Ihren Webserver
Konfigurieren Sie Nginx, um auf Ihre Website zuzugreifen. Erstellen Sie eine neue Konfigurationsdatei:

bash

sudo nano /etc/nginx/sites-available/tradingbot

Füge die folgende Konfiguration ein und speichere sie (ersetzen Sie your_domain durch die tatsächliche Domain oder IP-Adresse):

nginx

server {
    listen 80;
    server_name your_domain;

    root /var/www/tradingbot;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
}

Verlinke  die Konfigurationsdatei:

bash

sudo ln -s /etc/nginx/sites-available/tradingbot /etc/nginx/sites-enabled/

Klonen Sie Ihr Repository
Klonen Sie das Repository, das Ihre Tokenwebsite enthält, in das Webroot-Verzeichnis:

bash

cd /var/www/
sudo git clone https://github.com/SamSchim/TradingBot.git tradingbot
cd tradingbot
sudo git checkout main  # oder den entsprechenden Branch

Berechtigungen einstellen
Stelle  sicher, dass der Webserver die Dateien lesen kann:

bash

sudo chown -R www-data:www-data /var/www/tradingbot

Starten Sie den Webserver neu
Starten Sie Nginx neu, um die Änderungen zu übernehmen:

bash

    sudo systemctl restart nginx

    Testen Sie Ihre Website
    Öffnen Sie einen Webbrowser und geben Sie die IP-Adresse Ihres Raspberry Pi oder Ihre Domain ein. Sie sollten jetzt in der Lage sein, auf die TradingBot Tokenwebsite zuzugreifen.

Indem diese Schritte befolgen werden, wird der Raspberry Pi erfolgreich konfiguriert, um als Webserver für die TradingBot Tokenwebsite zu dienen.


Um die auf dem Raspberry Pi gehostete Website von außerhalb des Heimnetzwerks zugänglich zu machen, müssen einige zusätzliche Schritte durch geführt werden, um sicherzustellen, dass die Website sicher und von überall aus erreichbar ist. Hier sind die wichtigsten Schritte:
1. Statische IP-Adresse oder Dynamic DNS

    Statische IP: Fragen Sie Ihren Internetdienstanbieter, ob er Ihnen eine statische IP-Adresse zuweisen kann. Dies erleichtert den Fernzugriff auf Ihre Website, da die IP-Adresse konstant bleibt.
    Dynamic DNS (DDNS): Wenn eine statische IP nicht verfügbar ist, können Sie einen Dynamic DNS-Dienst nutzen, der Ihre wechselnde IP-Adresse mit einem festen Hostnamen verbindet. Dienste wie No-IP oder DynDNS bieten diese Funktionalität, oft auch in kostenlosen Basisversionen.

2. Portweiterleitung

    Konfigurieren Sie Ihre Router-Einstellungen, um den HTTP-Port (standardmäßig Port 80) und bei Bedarf HTTPS (Port 443) an die interne IP-Adresse Ihres Raspberry Pi weiterzuleiten. Dies ermöglicht es Internetverkehr, der auf diese Ports ankommt, direkt an Ihren Raspberry Pi geleitet zu werden.
    Der Zugang zum Router erfolgt üblicherweise über einen Webbrowser mit einer Adresse wie 192.168.1.1 oder 192.168.0.1. Sie benötigen Ihren Admin-Benutzernamen und Ihr Passwort.

3. Firewall-Konfiguration

    Stellen Sie sicher, dass Ihre Firewall die Ports 80 und 443 zulässt, damit externe Anfragen Ihre Website erreichen können.
    Dies kann auch auf dem Raspberry Pi erforderlich sein, je nachdem, welche Sicherheitseinstellungen Sie verwenden.

4. Sicherheit erhöhen

    HTTPS verwenden: Es ist sehr empfehlenswert, HTTPS anstelle von HTTP zu verwenden, um die Sicherheit Ihrer Website zu gewährleisten. Dies können Sie durch ein kostenloses Zertifikat von Let's Encrypt realisieren. Sie können certbot verwenden, ein Tool, das die Einrichtung und Erneuerung von SSL/TLS-Zertifikaten automatisiert:

    bash

    sudo apt install certbot python3-certbot-nginx
    sudo certbot --nginx

    Firewall-Einstellungen: Überprüfen Sie die Konfiguration Ihrer Firewall, um unbefugten Zugriff zu verhindern.
    Regelmäßige Updates: Halten Sie Ihr System und Ihre Anwendungen stets auf dem neuesten Stand, um Sicherheitslücken zu vermeiden.

5. Überwachung und Wartung

    Überwachen Sie regelmäßig den Zugriff auf Ihre Website und überprüfen Sie die Log-Dateien auf verdächtige Aktivitäten.
    Aktualisieren Sie regelmäßig Ihre Software, um von Sicherheitspatches zu profitieren.

Indem diese Schritte durch geführt werden, kann die Website sicher und zuverlässig von überall aus zugänglich gemacht werden.
