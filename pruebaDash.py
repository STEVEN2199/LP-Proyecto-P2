# Run this app with `python app.py` and
# visit http://127.0.0.1:8050/ in your web browser.

from dash import Dash, dcc, html
import plotly.express as px
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

print(x)
print(y)

app = Dash(__name__)

colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}
x.insert(0,"")
y.insert(0,0)
# assume you have a "long-form" data frame
# see https://plotly.com/python/px-arguments/ for more options
df = pd.DataFrame({
    "Nombre Producto": x,
    "Costo Producto": y,
    "Referencia": ["SF", "SF", "SF", "SF","Montreal", "Montreal"]
})

fig = px.bar(df, x="Nombre Producto", y="Costo Producto", color="Referencia", barmode="group")

fig.update_layout(
    plot_bgcolor=colors['background'],
    paper_bgcolor=colors['background'],
    font_color=colors['text']
)

app.layout = html.Div(style={'backgroundColor': colors['background']}, children=[
    html.H1(
        children='Dashboard De Productos Más Caros De Cada Categoria',
        style={
            'textAlign': 'center',
            'color': colors['text']
        }
    ),

    html.Div(children='En este dashboard podemos observar los productos más caros de cada categoria con su respectivo precio.', style={
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
    
