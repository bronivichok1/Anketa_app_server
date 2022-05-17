require('dotenv').config();
const express = require('express');
const sequelize = require('./db');
const models = require('./models/models');
const cors = require('cors');
const router = require('./routes/index');
const errorHandler = require('./middleware/ErrorHandlingMiddleware');
const path = require("path");
const fs = require('fs');
const carbone = require('carbone');

const PORT = process.env.PORT || 5000;

const app = express();
app.use(cors());
app.use(express.json());
app.use('/api', router);

app.use(errorHandler);

//create excel


app.post("/api/excel", (req, res) => {
  const data = req.body;
  
    var options = {
      convertTo : 'xlsx' 
    };
  
    carbone.render('./data.xlsx', data, options, function(err, result){
      if (err) {
        res.send(Promise.reject());
        console.log(err);
        
      }
      fs.writeFileSync('res.xlsx', result);
      res.send(Promise.resolve());
      
    });
  
  });
  
  app.get("/api/excelRes", (req, res) => {
    res.sendFile(`${__dirname}/res.xlsx`);
  });
///

const start = async () => {
    try {
        await sequelize.authenticate();
        await sequelize.sync();
        app.listen(PORT, '172.0.0.1', () => console.log(`Server started on port ${PORT}`));
    } catch (e) {
        console.log(e);
    }
}

start();