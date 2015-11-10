
var Controller = require(BASE_CONTROLLER),
	path = require('path'),
	util = require('util');

function PostsController() {
	Controller.call(this, 'Post');
};
util.inherits(PostsController, Controller);

PostsController.prototype.index = function(req, res, next) {
	this.Post
	.query()
	.eager('[comments, user]')
	.then(function (rows) {
		rows = rows.map(function (v, i) {
			v["height"] = 395;
			return v;
		});
		res.send(rows);
		next();
	});
};

PostsController.prototype.add = function(req, res, next) {

	this.Post
	.query()
	.insert({
		media_url: path.basename(UPLOADS_DIR) + '/' + req.file.filename
	})

	.catch(next);
};

module.exports = new PostsController();