# Recibe el directorio donde se encuentran los archivos
# y la palabra a buscar
uvsearch = function(directorio, palabra){
   # Saca una lista archivos presentes en el directorio
   libros = list.files(path=directorio, full.names=TRUE,pattern="*.csv")
   Reduce(function(resultados,libro){
     # Lee cada archivo como un csv, cuya primera columna es palabra seguida de frecuencia
     frecuencias = read.csv(file=libro, header=FALSE, stringsAsFactors = FALSE, quote = "", col.names=c("palabra","frecuencia"), encoding="UTF-8")
     # Busca la posicion de palabra en el dataframe de frecuencias
     linea = which(frecuencias$palabra == palabra)
     # Si la encontro...
     if(length(linea) > 0 && linea > 0){
       # Agregua el nombre del libro + frecuencia
       #resultados<- c(resultados, libro, strtoi(frecuencias[linea,]$frecuencia))
       resultados <- rbind(resultados, data.frame(libro=libro, frecuencia=strtoi(frecuencias[linea,]$frecuencia)))
     }
   }, libros, data.frame(libro=list(), frecuencia=list()))
}
poseedores <- uvsearch("out","love")
poseedores <- poseedores[order(poseedores$frecuencia, decreasing=FALSE),]
poseedores <- poseedores[seq(from=1, to=min(5, length(poseedores)+1), by=1),]
if(!is.null(poseedores) && row(poseedores) > 0){
  png('grafico.png')
  plot(poseedores, type = "h")
  dev.off()
}
