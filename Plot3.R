library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510",]

baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

#Plotagem em tela
grafico <- ggplot(baltimoreType, aes(year, Emissions, color = type))
grafico <- grafico + geom_line() + xlab("Anos") + ylab("PM2.5")
grafico <- grafico + ggtitle("Emissões de PM2.5 por Tipo de Fonte em Baltimore - 1999 a 2008")
print(grafico)


#Plotatem em arquivo
png("plotagem3.png")
grafico <- ggplot(baltimoreType, aes(year, Emissions, color = type))
grafico <- grafico + geom_line() + xlab("Anos") + ylab("PM2.5")
grafico <- grafico + ggtitle("Emissões de PM2.5 por Tipo de Fonte em Baltimore - 1999 a 2008")
print(grafico)
dev.off()