setwd(dir = "R/CeiAbreuR/ClasesDeObjetos/")

#Loading the table file
ensTab = read.table("ensembl_info.tab")
ensTab = ensTab[order(ensTab[,"genome_length"]),]

class(ensTab)
#data frame es una tabla (con renglones y columnas) para
#distintos tipos en cada columna. 

#mean(ensTab)
#Por ejemplo, esta función no jala porque R asume que 
#ensTab tiene columnas de diferentes tipos

#hagamos una tabla que solo lleve la longitud de los
#tres tipos de genes
ensTab[,c("coding_genes", "ncrna_genes", "pseudo_genes")]
genesTab = ensTab[,c("coding_genes", "ncrna_genes", "pseudo_genes")]
head(genesTab)

#Este objeto SIGUE siendo un data.frame
class(genesTab)

#Aquí ya nos conviene poder hacerle operaciones aritméticas
#a los datos almacenados en las columnas, entonces hay
#que convertirlo a un formato de matriz

genesMat = as.matrix(genesTab)
head(genesMat)

#El resultado visualizado se ve mucho como una tabla, pero
#en realidad para R, esto ya es trabajable para hacerle
#operaciones

mean(genesMat)
#Esto entrega el promedio, de todos los datos en la matriz

mean(genesMat[1,])
genesMat[1,]
#como podemos notar, esto entrega el promedio del primer
#renglón, un dato, pues, absolutamente inútil, sí

genesMat[,1]
mean(genesMat[,1])
#Este es el promedio de todos los datos de la primera
#columna, un dato que, podremos argumentar, tiene
#una mayor utilidad, que el primer dato inútil que
#obtuvimos, ahora ya nos estamos divirtiendo.

#los data.frames parecen ser bastante inútiles hasta el momento
#también la función de barplot batalla con esta clase de objeto

#barplot(genesTab)
#No funciona, ahorrale al comando la vergüenza y no lo descomentes

barplot(genesMat, beside = TRUE)

#Ahora, sí queremos una barplot que nos diera los valores por especie
#en lugar de por categoría de genes, pues, ya valió, no se puede

#Ahtecreas, sí se puede, pero antes de que te lances a hacerlo por
#el camino largo, date cuenta de que esto se trata de una matriz
#y por lo tanto, eso significa que puedes transponerla :D

barplot(t(genesMat), horiz=TRUE, las=1)

#Así de fácil, no se que signfique el parámetro de "las" pero parece
#que darle un valor de "1" acuesta los labels del eje "y" y pues
#así ya se ve presentable. Bien. "horiz" = TRUE voltea la gráfica
#para que salga en modo "horizontal", pensé que era obvio.

#Este es un vector integer
x=1:15
x

class(x)

#Este es un vector de carácteres
y = as.character(x)
y

class(y)

sort(y)
sort(x)

#Las funciones actuan sobre los vectores de formas muy distintas, aguas

genomeList = list("Human genome", 3.09e9, c(22097,15502,16146), c("44.7%", "7.32%", "1.96%"))
genomeList

#Las listas son muy flexibles y tienen mucha capacidad de manipulación
genomeList[[3]]
genomeList[[3]][2]

