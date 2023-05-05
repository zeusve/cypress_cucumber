const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const preprocessor = require("@badeball/cypress-cucumber-preprocessor");
const createEsbuildPlugin = require("@badeball/cypress-cucumber-preprocessor/esbuild");

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      require('cypress-mochawesome-reporter/plugin')(on);
      on("file:preprocessor",
      createBundler({
        reporter: 'cypress-mochawesome-reporter',
        reporterOptions: {
          charts: true,
          reportPageTitle: 'custom-title',
          embeddedScreenshots: true,
          inlineAssets: true,
          saveAllAttempts: false,
        },
        plugins: [createEsbuildPlugin.default(config)],
        
      }));
      preprocessor.addCucumberPreprocessorPlugin(on, config);
      return config;
    },
	specPattern: "**/*.feature",
  },
});
