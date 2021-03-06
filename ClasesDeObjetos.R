setwd(dir = "R/CeiAbreuR/ClasesDeObjetos/")

#Loading the table file
ensTab = read.table("ensembl_info.tab")
ensTab = ensTab[order(ensTab[,"genome_length"]),]

class(ensTab)
#data frame es una tabla (con renglones y columnas) para
#distintos tipos en cada columna. 

#mean(ensTab)
#Por ejemplo, esta funci�n no jala porque R asume que 
#ensTab tiene columnas de diferentes tipos

#hagamos una tabla que solo lleve la longitud de los
#tres tipos de genes
ensTab[,c("coding_genes", "ncrna_genes", "pseudo_genes")]
genesTab = ensTab[,c("coding_genes", "ncrna_genes", "pseudo_genes")]
head(genesTab)

#Este objeto SIGUE siendo un data.frame
class(genesTab)

#Aqu� ya nos conviene poder hacerle operaciones aritm�ticas
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
#rengl�n, un dato, pues, absolutamente in�til, s�

genesMat[,1]
mean(genesMat[,1])
#Este es el promedio de todos los datos de la primera
#columna, un dato que, podremos argumentar, tiene
#una mayor utilidad, que el primer dato in�til que
#obtuvimos, ahora ya nos estamos divirtiendo.

#los data.frames parecen ser bastante in�tiles hasta el momento
#tambi�n la funci�n de barplot batalla con esta clase de objeto

#barplot(genesTab)
#No funciona, ahorrale al comando la verg�enza y no lo descomentes

barplot(genesMat, beside = TRUE)

#Ahora, s� queremos una barplot que nos diera los valores por especie
#en lugar de por categor�a de genes, pues, ya vali�, no se puede

#Ahtecreas, s� se puede, pero antes de que te lances a hacerlo por
#el camino largo, date cuenta de que esto se trata de una matriz
#y por lo tanto, eso significa que puedes transponerla :D

barplot(t(genesMat), horiz=TRUE, las=1)

#As� de f�cil, no se que signfique el par�metro de "las" pero parece
#que darle un valor de "1" acuesta los labels del eje "y" y pues
#as� ya se ve presentable. Bien. "horiz" = TRUE voltea la gr�fica
#para que salga en modo "horizontal", pens� que era obvio.

#Este es un vector integer
x=1:15
x

class(x)

#Este es un vector de car�cteres
y = as.character(x)
y

class(y)

sort(y)
sort(x)

#Las funciones actuan sobre los vectores de formas muy distintas, aguas

genomeList = list("Human genome", 3.09e9, c(22097,15502,16146), c("44.7%", "7.32%", "1.96%"))
genomeList

#Las listas son muy flexibles y tienen mucha capacidad de manipulaci�n
genomeList[[3]]
genomeList[[3]][2]

