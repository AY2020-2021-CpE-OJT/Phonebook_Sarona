const mongoose = require('mongoose');
//userinfo Scheme

const infoSchema = mongoose.Schema({
    last_name: {
        type: String,
        required: true
    },
    first_name: {
        type: String,
        required: true
    },
    phone_numbers: {
        type: [String],
        required: true
    }
})

module.exports = mongoose.model('numbers_info', infoSchema)