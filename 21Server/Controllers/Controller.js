
function Controller (modelName) {
	var that = this;
	if (Array.isArray(modelName)) {
		modelName.forEach(function (name) {
			that[name] = rqModel(name);
		});
	} else
		this[modelName] = rqModel(modelName);
};

module.exports = Controller;