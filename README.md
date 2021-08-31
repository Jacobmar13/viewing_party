<h1 align="center">Viewing Party</h1>

<div align="center">

  [![Ruby](https://img.shields.io/badge/Made%20With-Ruby-red?style=flat&logo=ruby&logoColor=red)](https://www.ruby-lang.org/en/)
  [![Rails](https://img.shields.io/badge/Made%20With-Rails-red?style=flat&logo=ruby&logoColor=red)](https://rubyonrails.org/)
  
</div>

> This is the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

## About this Project

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and friend's.
[link to heroku page](https://protected-bastion-44831.herokuapp.com/)

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`

## API
- [The Movie DB API](https://developers.themoviedb.org/3/getting-started/introduction)
- Create an account and apply for an API key
- Take that key and create a `application.yml` file in the root directory
- Name it and use figaro to encrypt your key so it cant be seen from the public and add it to `application.yml` file

## Learning Goals
- Consume JSON APIs that require authentication
- Build an application that requires basic authentication
- Organize and refactor code to be more maintainable
- Implement a self-referential relationship in ActiveRecord
- Apply RuboCop’s style guide for code quality
- Utilize Continuous Integration using Travis CI
- Deploy to Heroku

## Future Goals
- Add a recommended movie to view
- Allow memnbers of the viewing party to vote on a selection of movies to watch
- Search by country of origin/primary language of films

## Contributors
- [Jacob Martinez](https://github.com/Jacobmar13)
- [Brett Jones](https://github.com/Bhjones45)

## Versions

- Ruby 2.7.2

- Rails 5.2.5

## Gems used

- [webmock](https://github.com/bblimke/webmock)
- [VCR](https://github.com/vcr/vcr)
- [Capybara](https://github.com/teamcapybara/capybara)
- [launchy](https://github.com/copiousfreetime/launchy)
- [rubocop](https://docs.rubocop.org/rubocop/1.20/index.html)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [orderly](https://github.com/jmondo/orderly)
- [Travis Ci](https://docs.travis-ci.com/)
- [simplecov](https://github.com/simplecov-ruby/simplecov)
- [figaro](https://github.com/laserlemon/figaro)

Example wireframes to follow are found [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)
