const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const menuController = require('./controllers/menu');
const mesaController = require('./controllers/mesa');
const clienteController = require('./controllers/cliente');
const cuentaController = require('./controllers/cuenta');
const usuarioController = require('./controllers/usuario');





app.post('/usuario', usuarioController.addUsuario);
app.post('/login', usuarioController.login);
app.get('/menu', menuController.getMenu);
app.get('/menuDisponible', menuController.getMenuDisponible);
app.put('/updateStatusMenu', menuController.updateStatusMenu);
app.post('/addCuenta', cuentaController.addCuenta);
app.post('/pagarCuenta', cuentaController.pagarCuenta);
app.get('/getTotalCuenta', cuentaController.getTotalCuenta);
app.get('/getCuandre', cuentaController.getCuandre);



app.get('/mesa', mesaController.getMesa);
app.post('/addMenu', mesaController.addMesa);
app.post('/addMenus', mesaController.addMenu);
app.get('/mesatype', menuController.getMenuByType);
app.put('/mesa', mesaController.updateStatusMesa);
app.get('/mesaOcupada', mesaController.getMesaOcupadas);
app.post('/cliente', clienteController.addClient);
app.get('/cliente', clienteController.getCliente);
app.post('/addComidaCliente', clienteController.addComidaCliente);
app.get('/getComidaCliente', clienteController.getComidaCliente);






app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
