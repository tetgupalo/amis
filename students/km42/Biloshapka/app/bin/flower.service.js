class FlowerService {

    validateFields(fields) {
        console.log(fields);
        return {
            name: this.validateName(fields.name),
            price: this.validatePrice(fields.price),
            status: this.validateStatus(fields.status),
            quantity: this.validateQuantity(fields.quantity)
        }
    };

    validateName(name) {
        var re =  /^[A-Za-z]+($|\s)/;
        if (!re.test(name)) {
            return "Incorrect name format";
        }
        if (name.length > 30) {
            return "Max length is 30";
        }
    }

    validatePrice(price) {
        var re = /^[0-9]{1,4}.[0-9]{0,2}($|\s)/
        if (!re.test(price)) {
           return "Incorrect price";
        }
    }
    validateStatus(status) {
        var re =  /^[A-Za-z]+($|\s)/;
        if (!re.test(status)) {
            return "Incorrect name format";
        }   
        if (status.length > 30) {
             return "Max length is 30";
        } 
    }
    validateQuantity(qua) {
        var re = /^[0-9]{1,10}($|\s)/;
         if (!re.test(qua)) {
            return "Incorrect format";
        }
    }
}
module.exports = new FlowerService();