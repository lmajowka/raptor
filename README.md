# Raptor

Raptor is an ABTest management system written in Ruby on Rails that generates a javascript file responsible for running the tests.
Which means you can use Raptor ABtests in your application regardless of your server side configuration and even if your whole page is delivered by a CDN

## Getting Started
1. Install Rails at the command prompt if you haven't yet:

        gem install rails

2. Migrate the data

        rake db:Setup

3. Run a server

        rails server

4. Check the app at

        http://localhost:3000