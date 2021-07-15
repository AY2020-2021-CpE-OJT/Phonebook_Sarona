const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const User_Infos = require('./schema');
require("dotenv/config");
const app = express();
// app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

//GET ALL
app.get('/', async (req, res) => {
    try {
        const fetchedInfo = await User_Infos.find();
        res.json({fetchedInfo});
    }catch {
        res.json({message: err})
    }
});

mongoose.connect(process.env.DB_URI,
    {useNewUrlParser: true,useUnifiedTopology: true,/*useFindAndModify: false*/}, 
    () => console.log('connected to db')
);

app.listen(process.env.PORT || 2000);