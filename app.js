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



app.get('/menu', menuController.getMenu);
app.get('/mesa', mesaController.getMesa);
app.get('/mesatype', menuController.getMenuByType);
app.put('/mesa', mesaController.updateStatusMesa);
app.post('/cliente', clienteController.addClient);
app.get('/cliente', clienteController.getCliente);




app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
