
var Model = require('objection').Model,
	hash = require('crypto').createHash('sha1');

function User() {
	Model.apply(this, arguments);
}
Model.extend(User);

User.tableName = 'users';

User.jsonSchema = {
	type: 'object',
	required: ['username', 'password'],

	properties: {
		username: {type: 'string', minLength: 3, maxLength: 21},
		password: {typw: 'string', minLength: 3, maxLength: 21}
	}
};

User.relationMappings = {
	posts: {
		relation: Model.OneToManyRelation,
		modelClass: MODELS_DIR + '/Post',
		join: {
			from: 'users.id',
			to: 'posts.user_id'
		}
	}
};

User.prototype.$beforeInsert = function () {
	if (this.password) {
		hash.update(this.password, 'utf8');
		this.password = hash.digest('hex');
	}
};

module.exports = User;