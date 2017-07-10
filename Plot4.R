library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dadosJuntos <- merge(NEI, SCC, by = "SCC")

regCoal <- grepl("coal", dadosJuntos$Short.Name, ignore.case = TRUE)

dadosCoal <- dadosJuntos[regCoal, ]

coalAgregados <- aggregate(Emissions ~ year, dadosCoal, sum)


#Plotagem em tela
grafico <- ggplot(dadosCoal, aes(factor(year), Emissions))
grafico <- grafico + geom_bar(stat = "identity")
grafico <- grafico + xlab("Anos") + ylab("PM2.5")
grafico <- grafico + ggtitle("Emissão de PM2.5 por Combustão de Carvão nos EUA - 1999 a 2008")
print(grafico)

#Plotagem em arquivo
png("plotagem4.png")
grafico <- ggplot(dadosCoal, aes(factor(year), Emissions))
grafico <- grafico + geom_bar(stat = "identity")
grafico <- grafico + xlab("Anos") + ylab("PM2.5")
grafico <- grafico + ggtitle("Emissão de PM2.5 por Combustão de Carvão nos EUA - 1999 a 2008")
print(grafico)
dev.off()