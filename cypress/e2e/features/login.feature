Feature: Login Page

    Background: Acces login Page
        Given A user enters to the login page

    Scenario Outline: Verify valid user can login
        When A user enters the username "<username>" and "<password>"
        When A user clicks on the login button
        Then A user will be logged in inventory page

        Examples:
            | username      | password     |
            | standard_user | secret_sauce |

    Scenario Outline: Verify invalid user can login
        When A user enters the username "<username>" and "<password>"
        When A user clicks on the login button
        Then A user should be shown an error message

        Examples:
            | username | password     |
            | bad_user | secret_sauce |