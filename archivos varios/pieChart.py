from dash import Dash, dcc, html
import plotly.express as px
from dash import Dash, dcc, html, Input, Output
import plotly.graph_objects as go
import pandas as pd
import csv  
import numpy as np


x2=[]
y2=[]
with open('promediosCategorias.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter = ',')
      
    for row in plots:
        x2.append(row[0])
        y2.append(row[1])   
        
        
'''       
    
app = Dash(__name__)


app.layout = html.Div([
    html.H4('Analysis of the restaurant sales'),
])

def generate_chart(x2, y2):
    #df = px.data.tips(). # replace with your own data source
    #fig = px.pie(df, values=y2, names=x2, hole=.3)
    fig = go.Figure(data=[go.Pie(labels=x2, values=y2)])
    #fig.show()
    return fig




app.run_server(debug=True)

''' 

'''
fig = go.Figure(data=[go.Pie(labels=x2, values=y2, pull=[0, 0.1, 0, 0])])
fig.update_layout(
    title_text="Costo Promedio De Cada Categoria",)
fig.show()
'''
app = Dash(__name__)
colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}
fig = go.Figure(data=[go.Pie(labels=x2, values=y2, pull=[0, 0.1, 0, 0])])
#fig.update_layout(title_text="Costo Promedio De Cada Categoria",)

app.layout = html.Div(style={'backgroundColor': colors['background']}, children=[
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
        figure=fig
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)
    