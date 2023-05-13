import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import {loginPage} from "../pages/LoginPage";
import { Assertion } from "chai";


Given("A user enters to the login page", () => {
    loginPage.navigate();
    cy.contains('Swag Labs');
});

When("A user enters the username {string} and {string}", function (username, password) {
    loginPage.enterUsername(username);
    loginPage.enterPassword(password);
});


When('A user clicks on the login button', () => {
    loginPage.clickLoginButton();
});


Then('A user will be logged in inventory page', () => {
    cy.url().should('include', '/inventory.html');
});

Then('A user should be shown an error message', () => {
    Assertion(loginPage.elements.errorMessage().should('be.visible'));
});