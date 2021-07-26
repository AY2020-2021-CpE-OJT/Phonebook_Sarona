const router = require('express').Router();

router.post('/register', (req, res) => {
    res.send('This is register');
});

router.post('/login', (req, res) => {
    res.send('This is login');
});

module.exports = router;