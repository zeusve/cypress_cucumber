import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { LoginUI } from "../ui/loginUI";
import { EnterText } from "../actions/enterText";
import { ButtonClick } from "../actions/buttonClick";


Given("A user enters to the login page", () => {
    cy.visit('/');
    cy.contains('Swag Labs');
});


When('A user enters the username {string}', (username) => {
    EnterText.Text(LoginUI.userInput(), username);
});

When('A user enters the password {string}', (password) => {
    EnterText.Text(LoginUI.passwordInput(), password);
});

When('A user clicks on the login button', () => {
    ButtonClick.Click(LoginUI.loginButton());
});

Then('A user will be logged in', () => {
    cy.url().should('include', '/inventory.html');
});

