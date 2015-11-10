
var Model = require('objection').Model,
	randToken = require('rand-token');

function Token () {
	Model.apply(this, arguments);
};
Model.extend(Token);

Token.tableName = 'tokens';

Token.jsonSchema = {
	type: 'object',
	required: ['user_id', 'token'],

	properties: {
		user_id: {type: 'number'},
		token: {type: 'string', minLength: 64, maxLength: 64},
		created: {type: 'string'}
	}
};

Token.prototype.$beforeInsert = function () {
	this.created = new Date().toMysqlFormat();
};

Token.existsForUserId = function (user_id) {
	return 	Token
			.query()
			.count('id as total')
			.where({user_id: user_id})
			.then(function (rows) {
				return (rows[0].total >= 1);
			});
};

Token.generate = function (user_id) {
	var token = randToken.uid(64);

	return	Token
			.query()
			.insert({
				user_id: user_id,
				token: token
			})
			.then(function (ids) {
				return token;
			});
};

Token.regenerate = function (user_id) {
	var token = randToken.uid(64);

	return	Token
			.query()
			.delete()
			.where({user_id: user_id})
			.return(Token.query().insert({token: token, user_id: user_id}))
			.return(token);
};

module.exports = Token;