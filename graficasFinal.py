# Run this app with `python app.py` and
# visit http://127.0.0.1:8050/ in your web browser.

from dash import Dash, dcc, html
import plotly.express as px
import pandas as pd
import csv  
import numpy as np

import plotly.express as px
import plotly.graph_objects as go
import csv  
##################################################################  
x = []
y = []
z = []
with open('productosCarosBaratos.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter = ',')
      
    for row in plots:
        x.append(row[0])
        y.append(float(row[1]))
        #print(type(row[1]))
        z.append(row[2])
##################################################################
x2=[]
y2=[]
with open('promediosCategorias.csv','r') as csvfile2:
    plots2 = csv.reader(csvfile2, delimiter = ',')
      
    for row in plots2:
        x2.append(row[0])
        y2.append(row[1])   
##################################################################
x3 = []
y3 = []
z3 = ["Audio", "Iluminacion","Tecnologia","Grabacion","Instrumentos"]  
with open('topCategorias.csv','r') as csvfile3:
    plots3 = csv.reader(csvfile3, delimiter = ',')
      
    for row in plots3:
        x3.append(row[0])
        y3.append(row[1])
##################################################################
print(y)
app = Dash(__name__)

colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}

df = pd.DataFrame({
    "Nombre Producto": x,
    "Costo Producto": y,
    "Referencia": z
})

df3 = pd.DataFrame({
    "Nombre Producto": x3,
    "Costo Producto": y3,
    "Referencia": z3
})
############################################################################################################
fig = px.bar(df, x="Nombre Producto", y="Costo Producto", color="Referencia", barmode="group", log_y = True)
fig2 = go.Figure(data=[go.Pie(labels=x2, values=y2, pull=[0, 0.1, 0, 0])])
fig3 = px.bar(df3, x="Nombre Producto", y="Costo Producto", color="Referencia", barmode="group",log_y = True)
############################################################################################################
fig.update_layout(
    plot_bgcolor=colors['background'],
    paper_bgcolor=colors['background'],
    font_color=colors['text']
)

app.layout = html.Div(style={'backgroundColor': colors['background']}, children=[
    html.H1(
        children='Dashboard De Productos Más Caros y Baratos De Cada Categoria',
        style={
            'textAlign': 'center',
            'color': colors['text']
        }
    ),

    html.Div(children='En este dashboard podemos observar los productos más caros y baratos de cada categoria con su respectivo precio.', style={
        'textAlign': 'center',
        'color': colors['text']
    }),

    dcc.Graph(
        id='example-graph-1',
        figure=fig
    ),
    
    html.H1(
        children='Costo Promedio De Cada Categoria',
        style={
            'textAlign': 'center',
            'color': colors['text']
        }
    ),

    html.Div(children='En este dashboard podemos observar cada categoria con su respectivo precio promedio y porcentaje respectivo.', style={
        'textAlign': 'center',
        'color': colors['text']
    }),

    dcc.Graph(
        id='example-graph-2',
        figure=fig2
    ),
    html.H1(
        children='Dashboard De Productos Más Populares De Cada Categoria',
        style={
            'textAlign': 'center',
            'color': colors['text']
        }
    ),

    html.Div(children='En este dashboard podemos observar los productos más populares de cada categoria.', style={
        'textAlign': 'center',
        'color': colors['text']
    }),

    dcc.Graph(
        id='example-graph-3',
        figure=fig3
    )
    
])
################################################################################
if __name__ == '__main__':
    app.run_server(debug=True)
    

