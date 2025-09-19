require('dotenv').config();
const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const fetch = require('node-fetch');

const app = express();
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 4000;

// Simple in-memory store for demo favorites (replace with MongoDB in production)
let demoFavorites = [];

// Proxy search to TheMealDB
app.get('/api/recipes/search', async (req, res) => {
  const { i, q } = req.query;
  try {
    if (i) {
      const ing = i.split(',')[0].trim();
      const r = await fetch(`https://www.themealdb.com/api/json/v1/1/filter.php?i=${encodeURIComponent(ing)}`);
      const json = await r.json();
      return res.json(json);
    }
    if (q) {
      const r = await fetch(`https://www.themealdb.com/api/json/v1/1/search.php?s=${encodeURIComponent(q)}`);
      const json = await r.json();
      return res.json(json);
    }
    const r = await fetch('https://www.themealdb.com/api/json/v1/1/search.php?s=');
    const json = await r.json();
    res.json(json);
  } catch (err) { res.status(500).json({ error: err.message }); }
});

// Lookup meal
app.get('/api/recipes/meal/:id', async (req, res) => {
  try {
    const r = await fetch(`https://www.themealdb.com/api/json/v1/1/lookup.php?i=${req.params.id}`);
    const json = await r.json();
    res.json(json);
  } catch (err) { res.status(500).json({ error: err.message }); }
});

// Demo favorites endpoints (replace with real DB + auth)
app.get('/api/favorites', (req, res) => {
  res.json(demoFavorites);
});

app.post('/api/favorites', (req, res) => {
  const { meal } = req.body;
  if (!meal || !meal.idMeal) return res.status(400).json({ error: 'meal required' });
  if (!demoFavorites.find(m => m.idMeal === meal.idMeal)) demoFavorites.push(meal);
  res.json({ ok: true, favorites: demoFavorites });
});

app.delete('/api/favorites/:id', (req, res) => {
  demoFavorites = demoFavorites.filter(m => m.idMeal !== req.params.id);
  res.json({ ok: true });
});

app.listen(PORT, () => console.log('Server started on', PORT));
