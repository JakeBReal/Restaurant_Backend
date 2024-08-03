const { Client } = require('pg');
require('dotenv').config();

const client = new Client({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'admin',
  database: process.env.DB_NAME || 'restaurant_db',
  port: process.env.DB_PORT || 5432
});

client.connect(err => {
  if (err) {
    console.error('No se ha podido conectar a la Base de Datos:', err);
  } else {
    console.log('Conectado exitosamente a la Base de Datos');
  }
});

module.exports = client;
