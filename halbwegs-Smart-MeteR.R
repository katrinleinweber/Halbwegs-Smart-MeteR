### Ziel: Ein R-Script bauen, das mit dem aktuellen Datum und dem Zählerstand
# aufgerufen werden kann, beide Datenpunkte einer Tabelle hinzufügt
# und in ein Diagramm den Stromverbrauch gegen die Zeit aufträgt.

# lese Datensatz ein
# install.packages("readr")
library(readr)
Verbrauch <- read_csv(file = "Strom.csv")
# visualisiere Zählerstand (siehe auch Help > Cheatsheets)
# install.packages("ggplot2")

# füge weiteren Zählerstand zur Tabelle hinzu
# install.packages("tibble")

# speichere aktualisierte Tabelle als Datei


### weiteres Ziel: Aus dem bisher erfassten Verbrauch den Abschlag hochrechnen
# und visualisieren.

# definiere Variablen (im Vertragssinne eher "Konstanten")

# breche Verbrauch auf Tage herunter & rechne auf Monat hoch
# 1. aus den Datumsangaben ein Intervall
# 2. Stromverbrauch zwischen zwei Zählerständen
# 3. Stromverbrauch pro Tag
# 4. realistischer Abschlag aus Grundpreis, kWh/Tag * 30 * Preis/kWh

# install.packages("dplyr")



# visualisiere Hochrechnung


  # hochgerechnet auf Monat

  # hochgerechnet auf Jahr

  # tatsächlich

  # aufhübschen (zusätzlich zu linetype & color oben)

### Eigene Weiterarbeit hieran:
# 1. einen echten Zählerstand in Strom.csv eintragen (Datumsformat: "YYYY-MM-DD")
# 2. Beispieldaten löschen & Strom.csv speichern
#
# Dann: .RProj-Datei regelmäßig öffnen, neuen Zählerstand in add_row(...) eintragen,
# und Script mittels "Source with Echo"-Button ausführen. Das jeweils aktuelle
# Diagramm sollte im "Plots"-Tab erscheinen.
#
# Weiterentwicklungsideen für dieses Script:
# https://github.com/katrinleinweber/Halbwegs-Smart-MeteR/issues
#
# Weitere R-Lern-Resourcen
# - http://exercism.io/languages/r/
# - https://swcarpentry.github.io/r-novice-gapminder/
