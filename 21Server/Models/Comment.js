
var Model = require('objection').Model,
	models = require(MODELS_IMPORT_FILE);

function Comment() {
	Model.apply(this, arguments);
};
Model.extend(Comment);

Comment.tableName = 'comments';

module.exports = Comment;