
var fs = require('fs'),
	path = require('path');

global.ROOT_DIR = __dirname;
global.PUBLIC_DIR = ROOT_DIR + '/public';


global.CONFIG_DIR = ROOT_DIR + '/config';
global.CONFIG_FILE = CONFIG_DIR + '/config.js';

global.MODELS_DIR = ROOT_DIR + '/Models';
global.MODELS_IMPORT_FILE = MODELS_DIR + '/importAll';

global.CONTROLLERS_DIR = ROOT_DIR + '/Controllers';
global.BASE_CONTROLLER = CONTROLLERS_DIR + '/Controller';

global.UPLOADS_DIR = PUBLIC_DIR + '/uploads';