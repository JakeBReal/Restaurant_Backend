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
          menu.precio,
          cuentas.id_cuenta,
	 	  (comidacliente.cantidad * menu.precio ) as total,
		  comidacliente.cantidad 
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
            id_cuenta: row.id_cuenta,
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
            precio: parseFloat(row.precio),
            cantidad: row.cantidad
          });
          acc[row.id_cliente].total += parseFloat(row.total);
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


  const pagarCuenta = async (req, res) => {
    const { id_cuenta, id_cliente, id_menu,total,id_mesa } = req.body;
    try {
      // Iniciar una transacción
      await db.query('BEGIN');
  
      // Actualizar el estado de la cuenta a true
      await db.query(
        'UPDATE cuentas SET estado = $1 WHERE id_cuenta = $2',
        [true, id_cuenta]
      );
      
      await db.query(
        'UPDATE mesas SET estado = $1, id_mesa = $2, id_cliente = null WHERE id_mesa = $2',
        [true, id_mesa]
      );
  
      // Eliminar registros de la tabla comidaCliente
      await db.query(
        'DELETE FROM comidaCliente WHERE id_cliente = $1',
        [id_cliente]
      );

          // Insertar un nuevo registro en la tabla totaldeVenta
    await db.query(
      'INSERT INTO totaldeVenta (id_cuenta, total, fecha) VALUES ($1, $2, CURRENT_DATE)',
      [id_cuenta, total]
    );
  
      // Confirmar la transacción
      await db.query('COMMIT');
  
      res.status(200).json({ok: true});
    } catch (err) {
      // Revertir la transacción en caso de error
      await db.query('ROLLBACK');
      console.error('Error al pagar la cuenta:', err);
      res.status(500).send('Error al pagar la cuenta');
    }
  };


  const getCuandre = async (req, res) => {
    const { filter } = req.query;
    try {
      let query = `
    SELECT *, totaldeventa.total 
    FROM totaldeventa 
    INNER JOIN cuentas ON cuentas.id_cuenta = totaldeventa.id_cuenta 
    INNER JOIN clientes ON clientes.id_cliente = cuentas.id_cliente
  `;

  switch (filter) {
    case 'yesterday':
      query += ` WHERE totaldeventa.fecha = CURRENT_DATE - INTERVAL '1 day'`;
      break;
    case 'last_week':
      query += ` WHERE totaldeventa.fecha >= CURRENT_DATE - INTERVAL '7 days'`;
      break;
    case 'last_month':
      query += ` WHERE totaldeventa.fecha >= CURRENT_DATE - INTERVAL '1 month'`;
      break;
    case 'last_year':
      query += ` WHERE totaldeventa.fecha >= CURRENT_DATE - INTERVAL '1 year'`;
      break;
    case 'all':
    default:
      // No additional filter for 'all'
      break;
  }
  const result = await db.query(query);
      res.status(200).json(result.rows);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Error al obtener el menú' });
    }
  };


module.exports = {
    addCuenta,
    getTotalCuenta,
    pagarCuenta,
    getCuandre
};
