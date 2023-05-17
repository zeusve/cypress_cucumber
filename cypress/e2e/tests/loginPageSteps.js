import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { Assertion } from "chai";
import { loginPage } from "../pages/loginPage";
import { inventoryPage } from "../pages/inventoryPage";



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
    Assertion(cy.url().should('eq',inventoryPage.constants.INVENTORY_URL));
});

Then('A user should be shown an error message', () => {
    Assertion(loginPage.elements.errorMessage().should('be.visible'));
});