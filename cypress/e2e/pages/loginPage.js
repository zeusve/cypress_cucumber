export const loginPage = {
    userInput: () => cy.get('#user-name'),
    passwordInput: () => cy.get('#password'),
    loginButton: () => cy.get('#login-button'),
    errorMessage: () => cy.get('[data-test="error"]'),

    navigate() {
        cy.log('Navigating to the login page');
        cy.visit('https://www.saucedemo.com/');
    },

    enterUsername(username) {
        cy.log('Entering username: ' + username);
        this.userInput().should('be.visible').click();
        this.userInput().clear();
        this.userInput().type(username);
    },

    enterPassword(password) {
        cy.log('Entering password: ' + password);
        this.passwordInput().should('be.visible').click();
        this.passwordInput().clear();
        this.passwordInput().type(password);
    },

    clickLoginButton() {
        cy.log('Clicking on the login button');
        this.loginButton().should('be.visible').click();
    }
    
}