import plotly.express as px
import pandas as pd
import csv

x4 = []
y4 = []
with open('productosStock.csv','r') as csvfile4:
    plots4 = csv.reader(csvfile4, delimiter = ',')
      
    for row in plots4:
        x4.append(row[0])
        y4.append(row[1])
        
df4 = pd.DataFrame(dict(
    x4, y4
    #r=[1, 5, 2, 2, 3],
    #theta=['processing cost','mechanical properties','chemical stability',thermal stability', 'device integration']
    ))
fig4 = px.line_polar(df4, r='y4', theta='x4', line_close=True)
fig4.show()