const express = require('express');
const mongoose = require('mongoose');
const User_Infos = require('../models/schema');
const authRoute = require('./auth');
const verify = require('./verifyToken');
require("dotenv/config");
const app = express();
app.use(express.json());

//Use auth
app.use('/user', authRoute);

//GET ALL
app.get('/', verify, async (req, res) => {
    try {
        const fetchedInfo = await User_Infos.find();
        res.json({fetchedInfo});
    }catch(err) {
        res.json({message: err})
    }
});

//GET BY ID
app.get('/:id', async (req, res) => {
    try {
        User_Infos.findById({_id: req.params.id}).then(function(fetchedInfo){
            res.json({fetchedInfo});
        });
        
    }catch(err) {
        res.json({message: err})
    }
});

//SAVE DATA TO DB
app.post('/', async (req,res) => {
    const postInfo = new User_Infos({               //Uses the model and at the same time get info
        last_name: req.body.last_name,
        first_name: req.body.first_name,
        phone_numbers: req.body.phone_numbers
    });
    try {
        const savedInfo = await postInfo.save();
        res.json(savedInfo);
    }catch(err) {
        res.json( {message: err} );
    }
});

//DELETE DATA FROM DB
app.delete('/:id', async (req,res) => {
    try {
        User_Infos.findByIdAndDelete({_id: req.params.id}).then(function(deletedInfo){
            res.json(deletedInfo);
        });
    }catch(err) {
        res.json( {message: err} );
    }
}),

//UPDATE DATA FROM DB
app.put('/:id', function(req, res, next){
    User_Infos.findByIdAndUpdate({_id: req.params.id}, req.body).then(function(){
        User_Infos.findOne({_id: req.params.id}).then(function(updatedInfo){
            res.send(updatedInfo);
        });
    }).catch(next);
});

mongoose.connect(process.env.DB_URI,
    {useNewUrlParser: true,useUnifiedTopology: true,useFindAndModify: false}, 
    () => console.log('connected to db')
);

app.listen(process.env.PORT || 2000);