const cucumber = require('cypress-cucumber-preprocessor').default
const allureWriter = require('@shelex/cypress-allure-plugin/writer');

module.exports = (on, config) => {
  allureWriter(on, config);

  return config;
};

module.exports = (on, config) => {
    on('file:preprocessor', cucumber())
    }
    