const db = require('../db');

const addClient = async (req, res) => {
    const { nombre } = req.body;
    console.log(nombre);
    try {
      const result = await db.query(
        'INSERT INTO clientes (nombre) VALUES ($1) RETURNING *',
        [nombre]
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error('Error adding client:', err);
      res.status(500).send('Error adding client');
    }
  };

  const getCliente = async (req, res) => {
    try {
      const result = await db.query('SELECT * FROM clientes');
      res.status(200).json(result.rows);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Error al obtener el menú' });
    }
  };

module.exports = {
  addClient,
  getCliente
};
