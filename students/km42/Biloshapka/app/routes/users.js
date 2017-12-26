var express = require('express');
var userDao = require('./../bin/user.dao');
var userService = require('./../bin/user.service');

var router = express.Router();

// router.get('/', function(req, res, next) {
//   userDao.findOne('test@test.com').then(data => console.log(data));
// });

router.get('/register', function(req, res, next) {
  res.render('registration', {errors: {}, title: "Registration"});
});

router.post('/register', function(req, res, next) {
  var errors = userService.validateRegistrationFields(req.body);
  if (!isEmpty(errors)) {
    res.render('registration', {errors: errors, title: "Registration"})
  } else {
    userDao.registerUser(req.body)
    .then(data => res.redirect('/users/authorize'))
    .catch(err => res.render('registration', {errors: {email: "Already exists"}, title: "Registration"}));
  }
});

router.get('/admin/register', function(req, res, next) {
  res.render('admin-register', {errors: {}, title: "Admin registration", });
});


router.get('/admin/authorize', function(req, res) {
  res.render('authorization', {errors: {}, title: "Admin authorization"});
});


router.post('/admin/register', function(req, res, next) {
  var errors = userService.validateRegistrationFields(req.body);
  if (!isEmpty(errors)) {
    res.render('admin-register', {errors: errors, title: "Admin registration"})
  } else {
    userDao.registerAdmin(req.body).then(data => res.redirect('/users/admin/authorize'))
    .catch(err => res.render('admin-register', {errors: {email: "Already exists"}, title: "Admin registration"}));;
  }
});

router.get('/authorize', function(req, res, next) {
  res.render('authorization', {errors: {}, title: "Authorization", admin: req.session.admin});
});

router.post('/authorize', function(req, res, next) {
  userDao.findOne(req.body.email).then(data => {
    if (data) {
      if (data.USER_PASSWORD != req.body.password) {
           res.render('authorization', {errors: {password: "Invalid credentials"}, title: 'Authorization'});
      } else {
        req.session.authorized = true;
        req.session.admin = data.TYPE_NAME == 'admin';
        console.log(req.session.authorized);
        res.redirect('/flowers');
      }
      
    } else {
      res.render('authorization', {errors: {email: "User not found"}, title: "Authorization"});
    }
  });
});

function isEmpty(obj) {
    for(var key in obj) {
        if(obj.hasOwnProperty(key) && !(typeof(obj[key]) === 'undefined'))
            return false;
    }
    return true;
}

module.exports = router;
