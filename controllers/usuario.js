const db = require('../db');

const addUsuario = async (req, res) => {
    const { nombre, email, rol, clave } = req.body;
    try {
      const result = await db.query(
        'INSERT INTO usuarios (nombre, email, rol, clave) VALUES ($1, $2, $3, $4) RETURNING *',
        [nombre, email, rol, clave]
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error('Error adding client:', err);
      res.status(500).send('Error adding client');
    }
  };

  const login = async (req, res) => {
    try {
      const { rol,clave } = req.body;
      const result = await db.query(
        'SELECT * FROM usuarios WHERE rol = $1 AND clave = $2',
        [rol, clave]
      );

      res.status(200).json(result.rows);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Error al obtener el menú' });
    }
  };

module.exports = {
  addUsuario,
  login
};
