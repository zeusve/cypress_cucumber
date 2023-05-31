#!/bin/sh

npm install cypress-cucumber-preprocessor allure-commandline --save-dev
npm run test
npx allure generate allure-results --clean -o allure-report
