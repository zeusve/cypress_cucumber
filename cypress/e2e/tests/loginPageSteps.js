import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { loginPage } from "../pages/loginPage";
import { EnterText } from "../actions/enterText";
import { ButtonClick } from "../actions/buttonClick";


Given("A user enters to the login page", () => {
    cy.visit('/');
    cy.contains('Swag Labs');
});

When("A user enters the username {string} and {string}", function (username, password) {
    EnterText.Text(loginPage.userInput(), username);
    EnterText.Text(loginPage.passwordInput(), password);
});


When('A user clicks on the login button', () => {
    ButtonClick.Click(loginPage.loginButton());
});


Then('A user will be logged in inventory page', () => {
    cy.url().should('include', '/inventory.html');
});

Then('A user should be shown an error message', () => {
    loginPage.errorMessage().should('exist');
});