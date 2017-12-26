var express = require('express');
var router = express.Router();

var flowerDao = require('./../bin/flower.dao');
var flowerService = require('./../bin/flower.service');

router.get('/', function(req, res, next) {
    flowerDao.findAll().then(data => {
        console.log(req.session.admin);
        res.render('flowers', { flowers: data, admin: req.session.admin});
    })
});

router.get('/create', function(req, res, next) {
    res.render('flowers-create', {errors: {}, admin: req.session.admin});
});

router.post('/create', function(req, res, next) {
    var errors = flowerService.validateFields(req.body);
    if (!isEmpty(errors)) {
        res.render('flowers-create', {errors})
    } else {
        flowerDao.save(req.body)
        .then(data => res.redirect('/flowers'))
        .catch(err => res.render('flowers-create', {errors: {name: "Already exists"}}));
    }
});

function isEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key) && !(typeof(obj[key]) === 'undefined'))
            return false;
    }
    return true;
}


module.exports = router;
