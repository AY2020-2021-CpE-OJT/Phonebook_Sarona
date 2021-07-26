const router = require('express').Router();
const User = require('../models/users');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken')

router.post('/register', async (req, res) => {
    // Hash password
    const salt = await bcrypt.genSalt(10);
    const hashPassword = await bcrypt.hash(req.body.password, salt);
    
    // New User
    const user = new User ({
        user_name: req.body.user_name,
        password: hashPassword
    });
    try {
        const savedUser = await user.save();
        res.send({user: user._id});
    } catch (err) {
        res.status(400).send(err);
    }
});

router.post('/login', async (req, res) => {
    // Username correct
    const user = await User.findOne({
        user_name: req.body.user_name
    });
    if(!user) return res.status(400).send('Username is not found');

    // Password correct
    const validPass = await bcrypt.compare(req.body.password, user.password);
    if(!validPass) return res.status(400).send('Invalid password');

    // Create and assign token
    const token = jwt.sign({_id: user._id}, process.env.TOKEN_SECRET);
    res.header('auth-token', token).send(token);
});

module.exports = router;