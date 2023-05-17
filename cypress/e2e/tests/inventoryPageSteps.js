import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { inventoryPage } from "../pages/inventoryPage";
import { loginPage } from "../pages/loginPage";
import { Assertion } from "chai";

Given("A user will be logged he is in the inventory page", () => {
    loginPage.login();
});

Then("I should see that the number is equal to {int}", (length) => {
    Assertion(inventoryPage.getInventoryItem().should('have.length', length));
});

Then("I should for the {string} product", (productName) => {
    Assertion(inventoryPage.getInventoryItem().contains(productName));
});