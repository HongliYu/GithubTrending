Feature: Basic

Background:
Given I launched the app

Scenario: Basic
Then I should see ReposTableView

When I touch RepoCell0

Then I should see RepoDetailsWebView
