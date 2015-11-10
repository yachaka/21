
module.exports = function (message, status) {
	return {
		success: true,
		status: status || 200,
		message: message || ""
	};
};