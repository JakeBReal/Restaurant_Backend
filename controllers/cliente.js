const db = require('../db');

const addClient = async (req, res) => {
    const { nombre } = req.body;
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

  const addComidaCliente = async (req, res) => {
    try {
      const { id_cliente,id_menu,disponibilidad } = req.body;
      if(disponibilidad){
        const result = await db.query(
          'INSERT INTO comidaCliente (id_cliente,id_menu) VALUES ($1,$2) RETURNING *',
          [id_cliente,id_menu]
        );
      }else{
        const result = await db.query(
          'DELETE FROM comidaCliente WHERE id_cliente=$1 and id_menu=$2',
          [id_cliente,id_menu]);
      }
  
      res.status(200).json({ok: true});
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Error al obtener el menú' });
    }
  };


  const getComidaCliente = async (req, res) => {
    try {
      const result = await db.query('SELECT * FROM public.comidacliente inner join clientes on clientes.id_cliente = comidacliente.id_cliente inner join menu on menu.id_menu = comidacliente.id_menu inner join mesas on mesas.id_cliente = comidacliente.id_cliente');
      
      const groupedClients = result.rows.reduce((acc, row) => {
        if (!acc[row.id_cliente]) {
          acc[row.id_cliente] = {
            nombre: row.nombre, // Asumiendo que hay un campo nombre_cliente en la tabla clientes
            numero_mesa: row.id_mesa, // Asumiendo que hay un campo numero_mesa en la tabla clientes
            descripcion: row.descripcion || "Sin comentarios", // Asumiendo que hay un campo descripcion_cliente en la tabla clientes
            orden: [],
            ordenSet: new Set()
          };
        }
        if (!acc[row.id_cliente].ordenSet.has(row.nombre)) {
          acc[row.id_cliente].orden.push({
            nombre: row.nombre,
            precio: parseFloat(row.precio)
          });
          acc[row.id_cliente].ordenSet.add(row.nombre);
        }
        return acc;
      }, {});
      
      const clients = Object.values(groupedClients).map(client => {
        delete client.ordenSet; // Eliminar el conjunto temporal antes de enviar la respuesta
        return client;
      });
      
  
      res.status(200).json(clients);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Error al obtener el menú' });
    }
  };


module.exports = {
  addClient,
  getCliente,
  addComidaCliente,
  getComidaCliente
};
