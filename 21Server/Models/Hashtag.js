
var Model = require('objection').Model,
	Comment = rqModel('Comment'),
	User = rqModel('User');

function Hashtag () {
	Model.apply(this, arguments);
};
Model.extend(Hashtag);

Hashtag.tableName = 'hashtags';

Hashtag.jsonSchema = {
	type: 'object',
	required: [],

	properties: {
		tag: {type: 'string', minLength: '1', maxLength: '255'}
	}
};

Hashtag.relationMappings = {
};

module.exports = Hashtag;