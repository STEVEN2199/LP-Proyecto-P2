import matplotlib.pyplot as plt
import pandas as pd
import csv  
import numpy as np

x = []
y = []
  
with open('top3categorias.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter = ',')
      
    for row in plots:
        x.append(row[0])
        y.append(row[1])
  
plt.bar(y, x, color = 'g', width = 0.5, label = "Precios")
#plt.xticks(x, rotation='vertical', size=10)
plt.yticks(x, size=7)
plt.xlabel('Productos')
plt.ylabel('Precios')
plt.title('Producto mas popular de cada categoria')
plt.legend()
plt.show()

''''''
x3 = []
y3 = []
  
with open('top3categorias.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter = ',')
      
    for row in plots:
        x3.append(row[0])
        y3.append(row[1])
  
plt.bar(x3, y3,bottom=0.264)
plt.xlabel("Precios", fontsize=8)
plt.ylabel("Productos", fontsize=8)
plt.xticks(x3, x3, fontsize=7, rotation=75)
plt.title("Productos Mas Populares De Cada Categoria")
plt.show()



x2=[]
y2=[]
with open('promediosCategorias.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter = ',')
      
    for row in plots:
        x2.append(row[0])
        y2.append(row[1])
plt.figure(figsize=(8,8))
#plt.pie(y2, labels=x2, startangle=90, autopct='%.1f%%')
plt.pie(y2, labels=x2, startangle=90 ,autopct='$%.1f%%')
plt.title('Promedio De Costo De Cada Categoria')
plt.show()