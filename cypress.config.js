const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const preprocessor = require("@badeball/cypress-cucumber-preprocessor");
const createEsbuildPlugin = require("@badeball/cypress-cucumber-preprocessor/esbuild");
const allureWriter = require("@shelex/cypress-allure-plugin/writer");

module.exports = defineConfig({
  reporter: "cypress-mochawesome-reporter",
  reporterOptions: {
    charts: true,
    reportPageTitle: "custom-title",
    embeddedScreenshots: true,
    inlineAssets: true,
    saveAllAttempts: false,
  },

  e2e: {
    baseUrl: "https://www.saucedemo.com/",
    chromeWebSecurity: false,
    specPattern: "**/*.feature",
    setupNodeEvents(on, config) {
      require('cypress-mochawesome-reporter/plugin')(on);
      on("file:preprocessor",
      createBundler({
        plugins: [createEsbuildPlugin.default(config)],
      }));
      preprocessor.addCucumberPreprocessorPlugin(on, config);
      allureWriter(on, config);
      return config;
    },
  },
});
