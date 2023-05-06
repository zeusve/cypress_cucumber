import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("A user enters to the login page", () => {
    cy.visit('/');
    cy.contains('Swag Labs');
});


When('A user enters the username {string}', (username) => {
    cy.get('#user-name').type(username);
});

When('A user enters the password {string}', (password) => {
    cy.get('#password').type(password);
});

When('A user clicks on the login button', () => {
    cy.get('#login-button').click();
});

Then('A user will be logged in', () => {
    cy.url().should('include', '/inventory.html');
});

