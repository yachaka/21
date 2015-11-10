
var Model = require('objection').Model,
	Comment = rqModel('Comment'),
	User = rqModel('User');

function Post () {
	Model.apply(this, arguments);
};
Model.extend(Post);

Post.tableName = 'posts';

Post.jsonSchema = {
	type: 'object',
	required: [],

	properties: {
		title: {type: 'string', minLength: '3', maxLength: '30'},
		media_url: {type: 'string'}
	}
};

Post.relationMappings = {
	user: {
		relation: Model.OneToOneRelation,
		modelClass: User,
		join: {
			from: 'posts.user_id',
			to: 'users.id'
		}
	},
	comments: {
		relation: Model.OneToManyRelation,
		modelClass: Comment,
		join: {
			from: 'posts.id',
			to: 'comments.post_id'
		}
	}
};

module.exports = Post;