
var fs = require('fs'),
	path = require('path'),
	models = {};

var files = fs.readdirSync(__dirname);

var name = path.basename(module.filename);
for (var i = 0; i < files.length; i++) {
	if (files[i].substr(-3) == '.js' && files[i] != name)
		models[files[i].substr(0, files[i].length - 3)] = require(__dirname + '/' + files[i]);
}

module.exports = models;