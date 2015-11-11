
var Controller = require(BASE_CONTROLLER),
	path = require('path'),
	util = require('util'),
	Q = require('q');

function SearchController() {
	Controller.call(this, ['Hashtag', 'User']);
};
util.inherits(SearchController, Controller);

SearchController.prototype.search = function(req, res, next) {
	if (!req.query.q || req.query.q.trim() == "") {
		res.send([]);
		return next();
	}

	Q.all([
		this.Hashtag
		.query()
		.whereRaw('MATCH(tag) AGAINST (? IN BOOLEAN MODE)', req.query.q + '*'),

		this.User
		.query()
		.whereRaw('MATCH(username) AGAINST (? IN BOOLEAN MODE)', req.query.q + '*')
	])
	.spread(function (hashtags, users) {
		hashtags.forEach(function (value) {
			value['type'] = 'tag';
		});
		users.forEach(function (value) {
			value['type'] = 'user';
		});

		res.send(hashtags.concat(users));
		next();
	})
	.fail(next);
};

module.exports = new SearchController();