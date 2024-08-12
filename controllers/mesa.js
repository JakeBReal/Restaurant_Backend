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

const getMesaOcupadas = async (req, res) => {
  try {
    const result = await db.query('select * from mesas inner join clientes on  clientes.id_cliente = mesas.id_cliente where mesas.estado = false');
    res.status(200).json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener el menú' });
  }
};

const addMesa= async (req, res) => {
  try {
    const { nombre,descripcion, precio, disponibilidad, imagen,tipo } = req.body;
    const result =  await db.query(
      'INSERT INTO menu (nombre, descripcion, precio, disponibilidad,imagen,tipo) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [nombre, descripcion, precio, disponibilidad,imagen,tipo]
    );
    res.status(200).json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener el menú' });
  }
};



const updateStatusMesa = async (req, res) => {
  try {
    const {id_mesa,id_cliente,status} = req.body;
    const result = await db.query(`UPDATE mesas
	SET estado=${status}, id_cliente=${id_cliente}
	WHERE id_mesa=${id_mesa};`);
    res.status(200).json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al obtener el menú' });
  }
};




module.exports = {
    getMesa,
    updateStatusMesa,
    getMesaOcupadas,
    addMesa
};
