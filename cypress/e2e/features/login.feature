Feature: Login Page
    Scenario: Succes Login
        Given A user enters to the login page
        When A user enters the username "standard_user"
        When A user enters the password "secret_sauce"
        When A user clicks on the login button
        Then A user will be logged in