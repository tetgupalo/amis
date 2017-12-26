class UserService {

    validateRegistrationFields(fields) {
        var errors = {
            email: this.validateEmail(fields.email),
            login: this.validateLogin(fields.login),
            name: this.validateName(fields.name),
            password: this.validatePassword(fields.password),
            phone: this.validatePhone(fields.phone),
            confPass: this.confPass(fields.password, fields.confPass)
        }
        return errors;
    }

    confPass(pass, conf) {
        if (pass != conf) {
            return "Password is not confirmed";
        }
    }

    validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!re.test(email.toLowerCase())) {
            return "Email is incorrect";
        }
        if (email.length >= 30) {
            return "Email max length is 29";
        }
    }

    validateLogin(name) {
        var re = /^[A-Za-z0-9.@#_]+($|\s)/;
        if (!re.test(name)) {
            return "Username should contain only letters or spec symbols";
        }
        if (name.length > 30) {
            return "Login max length is 30";
        }
    }

    validatePassword(pass) {
        var re = /^[A-Za-z!#$%&*+-=?^_`{|}~\.0-9@]+($|\s)/;
        if (!re.test(pass)) {
            return "Not well formed password";
        }
        if (pass.length < 6 || pass.length > 30) {
            return "Incorrect size (6 <= len <= 30)";
        }
    }

    validatePhone(phone) {
        var re = /^[0-9]{2,15}($|\s)/;
        if (!re.test(phone)) {
            return "Not well formed phone";
        }
        if (phone.length <= 2 || phone.length > 15) {
            return "Incorrect size (3 <= len < 15)";
        }
    }
    validateName(name) {
        var re = /^[A-Za-z]+($|\s)/;
        if (!re.test(name) ) {
            return "Username should contain only letters or spec symbols";
        }
        if (name.indexOf(' ') == -1) {
             return "Should contain space";
        }
        if (name.length > 30) {
            return "Name max length is 30";
        }   
    }

}

module.exports = new UserService();