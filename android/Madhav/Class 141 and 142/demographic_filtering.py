import pandas as pd
import numpy as np

df = pd.read_csv('final.csv')

C = df['vote_average'].mean()
m = df['vote_count'].quantile(0.9)
qmovies = df.copy().loc[df['vote_count']>=m]

def weighted_rating(x, m = m, C = C):
  v = x['vote_count']
  R = x['vote_average']

  return ((v/(v+m))*R)+((m/(v+m))*C)

qmovies['score'] = qmovies.apply(weighted_rating, axis = 1)

qmovies = qmovies.sort_values("score", ascending=False)
output = qmovies[['title', 'poster_link', 'release_date', 'runtime', 'vote_average', 'overview']].head(20).values.tolist()