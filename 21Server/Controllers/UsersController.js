
var Controller = require(BASE_CONTROLLER),
	path = require('path'),
	util = require('util');

function UsersController() {
	Controller.call(this, 'User');
};
util.inherits(UsersController, Controller);

UsersController.prototype.index = function(req, res, next) {
	this.User
	.query()
	.then(function (rows) {
		res.send(rows);
		next();
	})
	.catch(next);
};

UsersController.prototype.register = function(req, res, next) {

	this.User
	.query()
	.insert({
		username: req.body.username,
		password: req.body.password
	})

	.catch(next);
};

module.exports = new UsersController();