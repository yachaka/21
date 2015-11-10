
function UnauthorizedError() {
	Error.apply(this, arguments);
}

module.exports = UnauthorizedError;