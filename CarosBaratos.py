# Run this app with `python app.py` and
# visit http://127.0.0.1:8050/ in your web browser.

from dash import Dash, dcc, html
import plotly.express as px
import pandas as pd
import csv  
import numpy as np

x = []
y = []
z = []
  
with open('productosCarosBaratos2.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter = ',')
      
    for row in plots:
        x.append(row[0])
        y.append(row[1])
        z.append(row[2])

app = Dash(__name__)

colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}

print(x)
print(y)
print(z)
print(len(x))
print(len(y))
print(len(z))


# assume you have a "long-form" data frame
# see https://plotly.com/python/px-arguments/ for more options
df = pd.DataFrame({
    "Nombre Producto": x,
    "Costo Producto": y,
    "Referencia": z
})

fig = px.bar(df, x="Nombre Producto", y="Costo Producto", color="Referencia", barmode="group")

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
        id='example-graph-2',
        figure=fig
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)
    
