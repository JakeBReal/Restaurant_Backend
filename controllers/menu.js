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

module.exports = {
  getMenu
};
