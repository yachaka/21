
var RememberMeStrategy = require('passport-remember-me').Strategy,
	Token = rqModel('Token'),
	User = rqModel('User'),
	util = require('util');

module.exports = new RememberMeStrategy(
	/*
	 * Authenticating based on token
	 */
	function (token, done) {
		var tkData;

		Token
		.query()
		.select(['id', 'user_id'])
		.where({
			token: token
		})
		.limit(1)
		.then(function (res) {
			if (!res[0]) {
				done(null, false);
				return;
			}
			tkData = res[0];
			return Token.query().where({id: tkData.id}).delete()
					.then(function (patch) {
						console.log(tkData)
						return User.query().where({id: tkData.user_id}).limit(1);
					})
					.then(function (user) {
						if (user[0])
							return done(null, user[0]);
						return done(null, false);
					});
		})
		.catch(done);
	},

	/* Generating token function
	 *
	 * Call done (err, newToken) : cookie will be set
	 */
	function (user, done) {
		Token
		.generate(user.id)
		.then(done.bind(null, null), done);
	}
);