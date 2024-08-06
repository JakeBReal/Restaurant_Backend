const db = require('../db');

const getMenu = async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM menu');
    res.status(200).json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener el menú' });
  }
};

const getMenuByType = async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM menu');
    const rows = result.rows;

    const menuByType = {
      'Desayunos': [],
      'Entradas': [],
      'Ensaladas': [],
      'Bebidas': [],
      'Postres': [],
      'Platos Fuertes': [],
      'Pastas': [],
      'Comidas Rapidas': []
    };

    rows.forEach(item => {
      if (menuByType[item.tipo]) {
        menuByType[item.tipo].push(item);
      }
    });

    res.status(200).json(menuByType);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener el menú' });
  }
};


module.exports = {
  getMenu,
  getMenuByType
};
