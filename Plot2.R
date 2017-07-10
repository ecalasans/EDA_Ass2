NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510",]

dadosAgregados <- aggregate(Emissions ~ year, baltimore, sum)

#Plotagem na tela
with(dadosAgregados, plot(year, Emissions, pch = 20, ylab = "PM2.5", xlab = "Anos", xlim = range(year, na.rm = TRUE)))
lines(dadosAgregados$year, dadosAgregados$Emissions, type = "l", col = "red")
title("Emissões de PM2.5 em Baltimore - 1999 a 2008")

#Plotagem em arquivo
png("plotagem2.png")
with(dadosAgregados, plot(year, Emissions, pch = 20, ylab = "PM2.5", xlab = "Anos", xlim = range(year, na.rm = TRUE)))
lines(dadosAgregados$year, dadosAgregados$Emissions, type = "l", col = "red")
title("Emissões de PM2.5 em Baltimore - 1999 a 2008")
dev.off()