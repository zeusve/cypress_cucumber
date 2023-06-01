#!/bin/sh

npm install 
npm install -D @bahmutov/cypress-esbuild-preprocessor
npm install -D @esbuild-plugins/node-modules-polyfill
npm outdated
npm update
npm run test
npx allure generate allure-results --clean -o allure-report
