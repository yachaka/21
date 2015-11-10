
var Controller = require(BASE_CONTROLLER),
	path = require('path'),
	util = require('util');

function SearchController() {
	Controller.call(this, ['Hashtag', 'User']);
};
util.inherits(SearchController, Controller);

SearchController.prototype.search = function(req, res, next) {
	if (!req.query.q || req.query.q.trim() == "") {
		res.send([]);
		return next();
	}

	this.Hashtag

	.query()
	.whereRaw('MATCH(tag) AGAINST (? IN BOOLEAN MODE)', req.query.q + '*')
	.then(function (rows) {
		console.log(rows);
		res.send(rows);
		next();
	});
};

module.exports = new SearchController();