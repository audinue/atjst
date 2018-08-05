
const { parse } = require('./parser');

module.exports = template => new Function('data', parse(template));
