
var BasicStrategy = require('passport-http').BasicStrategy,
	crypto = require('crypto'),
	User = rqModel('User');

module.exports = new BasicStrategy({
		passReqToCallback: true
	},
	function (req, username, password, done) {
		if (req.user)
			return done(null, req.user);

		var hash = crypto.createHash('sha1');
		hash.update(password);
		var hashed = hash.digest('hex');

		User

		.query()
		.limit(1)
		.where({
			username: username,
			password: hashed
		})
		.then(function (rows) {
			done(null, rows[0]);
		})
		.catch(done);
	}
);