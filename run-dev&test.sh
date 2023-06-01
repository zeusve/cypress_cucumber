#!/bin/sh

npm install cypress-cucumber-preprocessor @bahmutov/cypress-esbuild-preprocessor allure-commandline --save-dev
npm outdated
npm update
npm run test
npx allure generate allure-results --clean -o allure-report
