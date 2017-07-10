NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dadosPorAno <- aggregate(Emissions ~ year, NEI, sum)

with(dadosPorAno, plot(year, Emissions, pch = 20, ylab = "PM2.5", xlab = "Anos", xlim = range(year, na.rm = TRUE)))
lines(dadosPorAno$year, dadosPorAno$Emissions, type = "l")
title("Emissões de PM.25 nos EUA - 1999 a 2008")

#Saída para png
png("plotagem1.png")
with(dadosPorAno, plot(year, Emissions, pch = 20, ylab = "PM2.5", xlab = "Anos", xlim = range(year, na.rm = TRUE)))
lines(dadosPorAno$year, dadosPorAno$Emissions, type = "l")
title("Emissões de PM.25 nos EUA - 1999 a 2008")
dev.off()
