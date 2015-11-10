
module.exports = {
	database: {
		client: 'mysql',
		connection: {
			host: 'localhost',
			user: 'root',
			password: '123456',
			database: '21'
		},
		pool: {
			min: 0,
			max: 100
		},
		debug: true
	}
};