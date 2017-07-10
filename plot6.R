library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreCarros <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
losAngelesCarros <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]

baltimoreCarrosAnos <- aggregate(Emissions ~ year, baltimoreCarros, sum)
losAngelesCarrosAnos <- aggregate(Emissions ~ year, losAngelesCarros, sum)

rangeBaltimore <- range(baltimoreCarrosAnos$Emissions)
rangeLosAngeles <- range(losAngelesCarrosAnos$Emissions)
limites <- c(rangeBaltimore[1], rangeLosAngeles[2])

cidades <- merge(baltimoreCarrosAnos, losAngelesCarrosAnos, by = "year")

#Plotagem em tela
par(mfcol = c(2,1))
plot(baltimoreCarrosAnos$year, baltimoreCarrosAnos$Emissions, pch = 20, ylim = rangeBaltimore, xlab = "Anos",
    ylab = "PM2.5")
lines(baltimoreCarrosAnos$year, baltimoreCarrosAnos$Emissions, col = "red")
title("Emissões de PM2.5 por Veículos Motorizados em Baltimore - 1999 a 2008")

plot(losAngelesCarrosAnos$year, losAngelesCarrosAnos$Emissions, pch = 20, ylim = rangeLosAngeles, xlab = "Anos",
     ylab = "PM2.5")
lines(losAngelesCarrosAnos$year, losAngelesCarrosAnos$Emissions, col = "green")
title("Emissões de PM2.5 por Veículos Motorizados em Los Angeles - 1999 a 2008")

#Plotagem em arquivo
png("plotagem6.png")
par(mfcol = c(2,1))
plot(baltimoreCarrosAnos$year, baltimoreCarrosAnos$Emissions, pch = 20, ylim = rangeBaltimore, xlab = "Anos",
     ylab = "PM2.5")
lines(baltimoreCarrosAnos$year, baltimoreCarrosAnos$Emissions, col = "red")
title("Emissões de PM2.5 por Veículos Motorizados \nem Baltimore - 1999 a 2008")

plot(losAngelesCarrosAnos$year, losAngelesCarrosAnos$Emissions, pch = 20, ylim = rangeLosAngeles, xlab = "Anos",
     ylab = "PM2.5")
lines(losAngelesCarrosAnos$year, losAngelesCarrosAnos$Emissions, col = "green")
title("Emissões de PM2.5 por Veículos Motorizados \nem Los Angeles - 1999 a 2008")
dev.off()
