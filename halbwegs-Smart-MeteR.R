### Ziel: Ein R-Script bauen, das mit dem aktuellen Datum und dem Zählerstand
# aufgerufen werden kann, beide Datenpunkte einer Tabelle hinzufügt
# und in ein Diagramm den Stromverbrauch gegen die Zeit aufträgt.

# lese Datensatz ein
# install.packages("readr")
library(readr)
Verbrauch <- read_csv(file = "Strom.csv")
# visualisiere Zählerstand (siehe auch Help > Cheatsheets)
# install.packages("ggplot2")
library(ggplot2)
ggplot(data = Verbrauch, mapping = aes(x = Datum, y = Strom_kWh)) +
  geom_point() +
  stat_smooth()

# füge weiteren Zählerstand zur Tabelle hinzu
# install.packages("tibble")
library(tibble)
Verbrauch <- add_row(.data = Verbrauch,
                     Datum = Sys.Date(), # oder "YYYY-MM-DD" selbst eintragen
                     Strom_kWh = 278.9)

# speichere aktualisierte Tabelle als Datei
write_csv(x = Verbrauch, path = "Strom.csv")


### weiteres Ziel: Aus dem bisher erfassten Verbrauch den Abschlag hochrechnen
# und visualisieren.

# definiere Variablen (im Vertragssinne eher "Konstanten")
Strompreis_EUR_pro_kWh <- 0.25
Stromgrundpreis_EUR_pro_Monat <- 10
Stromabschlag_EUR_pro_Monat <- 15

# breche Verbrauch auf Tage herunter & rechne auf Monat hoch
# 1. aus den Datumsangaben ein Intervall
# 2. Stromverbrauch zwischen zwei Zählerständen
# 3. Stromverbrauch pro Tag
# 4. realistischer Abschlag aus Grundpreis, kWh/Tag * 30 * Preis/kWh

# install.packages("dplyr")
library(dplyr)

Abschlag <-
  mutate(
    .data = Verbrauch,
    Intervall_Tage = as.numeric(Datum - lag(Datum)), # oder as.int()

    Strom_kWh_am_Tag = (Strom_kWh - lag(Strom_kWh)) / Intervall_Tage,

    Abschlag_Strom_EUR
    = Strom_kWh_am_Tag * 30
    * Strompreis_EUR_pro_kWh
    + Stromgrundpreis_EUR_pro_Monat
  )


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
