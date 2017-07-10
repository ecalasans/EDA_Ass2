library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreCarros <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]

baltimoreCarrosAnos <- aggregate(Emissions ~ year, baltimoreCarros, sum)

#Plotagem em tela
grafico <- ggplot(baltimoreCarrosAnos, aes(factor(year), Emissions))
grafico <- grafico + geom_bar(stat = "identity") 
grafico <- grafico + ggtitle("Emissões por Veiculos Motorizados em Baltimore - 1999 a 2008") + xlab("Anos") +
  ylab("PM2.5")
print(grafico)

#Plotagem em arquivo
png("plotagem5.png")
grafico <- ggplot(baltimoreCarrosAnos, aes(factor(year), Emissions))
grafico <- grafico + geom_bar(stat = "identity") 
grafico <- grafico + ggtitle("Emissões por Veiculos Motorizados em Baltimore - 1999 a 2008") + xlab("Anos") +
  ylab("PM2.5")
print(grafico)
dev.off()