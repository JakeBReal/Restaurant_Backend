const db = require('../db');

const getMesa = async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM mesas');
    res.status(200).json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener el menú' });
  }
};

module.exports = {
    getMesa
};
