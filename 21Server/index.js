
// Application Constants
require('./konstants');

// Application Functions
require(CONFIG_DIR + '/functions');

// Application dependencies bootstrap
var path = require('path'),
	shortid = require('shortid');

var express = require('express'),
	session = require('express-session'),
	cookieParser = require('cookie-parser'),
	knex = require('knex')(require(CONFIG_FILE).database),
	passport = require('passport'),
	bodyParser = require('body-parser'),
	libMulter = require('multer'),
	multer = libMulter({
		storage: libMulter.diskStorage({
			destination: 'public/uploads/',
			filename: function (req, file, cb) {
				cb(null, shortid.generate() + path.extname(file.originalname));
			}
		})
	}),
	objection = require('objection'),
	Model = objection.Model;

	Model.knex(knex);

// Application Bootstrap
var Responses = require('./Responses');
	app = express();

// Authentification Strategy
passport.use('login', require('./BasicStrategy'));
passport.use('remember-me', require('./RememberMeStrategy'));
passport.serializeUser(function(user, done) {
	done(null, user);
});
passport.deserializeUser(function(user, done) {
	done(null, user);
});


// Routing
var Router = express.Router({
	caseSensitivity: true
});

var AuthRouter = express.Router({
	caseSensitivity: true
});
AuthRouter.use(function(req, res, next) {
	// if (req.isAuthenticated())
		return next();
	next(new Error('Not Authorized'));
});

/*
 *		AUTHENTICATED ROUTING
 **********************************/
/*
 *	SEARCH ROUTING
 */
AuthRouter.get('/search', function (req, res, next) {
	var SearchController = rqController('Search');
	SearchController.search(req, res, next);
});

/*
 *	POSTS ROUTING
 */
AuthRouter.get('/posts', function (req, res, next) {
	var PostsController = rqController('Posts');
	PostsController.index(req, res, next);
});

AuthRouter.post('/posts', multer.single('image'), function (req, res, next) {
	var PostsController = rqController('Posts');
	PostsController.add(req, res, next);
});

/*
 *	USERS ROUTING
 */
Router.get('/login', passport.authenticate('login'), function (req, res, next) {
	var Token = rqModel('Token');

	Token
	.regenerate(req.user.id)
	.then(function (token) {
		res.cookie('remember_me', token, {path: '/', httpOnly: true, maxAge: 2592000000});
		res.send(Responses.OkResponse("Login succeed"));
		next();
	})
	.catch(next);
});

AuthRouter.get('/session', function (req, res, next) {
	res.send(Responses.OkResponse("Session recreated, token consumed"));
});

AuthRouter.get('/users', function (req, res, next) {
	console.log('yay!');
	res.send('lol');
	next();
});

AuthRouter.post('/users', function (req, res, next) {
	var UsersController = rqController('Users');
	UsersController.register(req, res, next);
});




/*
 *		CONFIGURATION 		*
 */
app.use(express.static('public'));

// Application Headers
app.use(function (req, res, next) {
	res.type('json');
	next();
});

// Application body parsers
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

// Session
app.use(session({
	secret: '21 is so freaking cool',
	resave: false,
	saveUninitialized: false
}));

app.use(passport.initialize());
app.use(passport.session());
app.use(passport.authenticate('remember-me'));

// Routing
app.use(Router);
app.use(AuthRouter);

// Application Error handler
app.use(function (err, req, res, next) {
	console.log(err);
	console.log(err.stack);
	res.send({error: err.message});
	next();
});

app.listen(3000);