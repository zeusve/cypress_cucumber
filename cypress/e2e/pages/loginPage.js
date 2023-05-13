class LoginPage {
    static constants = {
        LOGIN_URL: 'https://www.saucedemo.com/',
    };

    elements = {
    userInput: () => cy.get('#user-name'),
    passwordInput: () => cy.get('#password'),
    loginButton: () => cy.get('#login-button'),
    errorMessage: () => cy.get('[data-test="error"]'),
    };

    navigate() {
        cy.log('Navigating to the login page');
        cy.visit(LoginPage.constants.LOGIN_URL);
    }

    enterUsername(username) {
        cy.log('Entering username: ' + username);
        this.elements.userInput().should('be.visible').click();
        this.elements.userInput().clear();
        this.elements.userInput().type(username);
    }

    enterPassword(password) {
        cy.log('Entering password: ' + password);
        this.elements.passwordInput().should('be.visible').click();
        this.elements.passwordInput().clear();
        this.elements.passwordInput().type(password);
    }

    clickLoginButton() {
        cy.log('Clicking on the login button');
        this.elements.loginButton().should('be.visible').click();
    }
    
}

export const loginPage = new LoginPage();