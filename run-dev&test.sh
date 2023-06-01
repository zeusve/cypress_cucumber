#!/bin/sh

npm install 
npm i -D cypress @bahmutov/cypress-esbuild-preprocessor esbuild
npm outdated
npm update
npm run test
npx allure generate allure-results --clean -o allure-report
