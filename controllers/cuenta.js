const db = require('../db');

const addCuenta = async (req, res) => {
    const { id_cliente } = req.body;
    try {
      const result = await db.query(
        'INSERT INTO cuentas (id_cliente,total,estado) VALUES ($1,$2,$3) RETURNING *',
        [id_cliente,0,false]
      );
      res.json(result.rows[0]);
    } catch (err) {
      console.error('Error adding client:', err);
      res.status(500).send('Error adding client');
    }
  };

  const getTotalCuenta = async (req, res) => {
    try {
      const result = await db.query(`
        SELECT 
          clientes.id_cliente,
          clientes.nombre AS nombre_cliente,
          mesas.id_mesa AS numero_mesa,
          menu.nombre AS nombre_menu,
          menu.precio
        FROM cuentas
        INNER JOIN clientes ON clientes.id_cliente = cuentas.id_cliente
        INNER JOIN mesas ON mesas.id_cliente = clientes.id_cliente
        INNER JOIN comidacliente ON comidacliente.id_cliente = clientes.id_cliente
        INNER JOIN menu ON menu.id_menu = comidacliente.id_menu
        WHERE cuentas.estado = false
      `);
  
      const groupedClients = result.rows.reduce((acc, row) => {
        if (!acc[row.id_cliente]) {
          acc[row.id_cliente] = {
            id: row.id_cliente,
            nombre: row.nombre_cliente,
            tableId: row.numero_mesa,
            orders: [],
            currency: 'USD',
            total: 0,
            ordenSet: new Set()
          };
        }
        if (!acc[row.id_cliente].ordenSet.has(row.nombre_menu)) {
          acc[row.id_cliente].orders.push({
            nombre: row.nombre_menu,
            precio: parseFloat(row.precio)
          });
          acc[row.id_cliente].total += parseFloat(row.precio);
          acc[row.id_cliente].ordenSet.add(row.nombre_menu);
        }
        return acc;
      }, {});
  
      const clients = Object.values(groupedClients).map(client => {
        delete client.ordenSet; // Eliminar el conjunto temporal antes de enviar la respuesta
        return client;
      });
  
      res.json(clients);
    } catch (err) {
      console.error('Error getting total cuentas:', err);
      res.status(500).send('Error getting total cuentas');
    }
  };


module.exports = {
    addCuenta,
    getTotalCuenta
};
