# Raptor

[![Code Climate](https://codeclimate.com/github/lmajowka/raptor/badges/gpa.svg)](https://codeclimate.com/github/lmajowka/raptor)

Raptor is an ABTest management system written in Ruby on Rails that generates a javascript file responsible for running the tests.
Which means you can use Raptor ABtests in your application regardless of your server side configuration and even if your whole page is delivered by a CDN

## Getting Started
1. Install Rails at the command prompt if you haven't yet:

        gem install rails

        rake db:setup

        rails server

2. Check the app at

        http://localhost:3000

   Play with experiments and versions

3. Checking in development:

   In your website's head, place the tag

        <script src="http://localhost:3000/js.js"></script>

   The tests should start running

## Playing on production

1. Deploy your raptor application to a server ( I recommend heroku, it's a good place to start )

2. in your website's head, use the tag with you raptor's app domain

        <script src="http://yourraptorappdomain.com/js.js"></script>

3. Use the parameters  seedrafts and forceVersion to check that the experiment is well configured

        http://yourraptorappdomain.com/my-landing-page?seedrafts&forceversion=6

4. Change or experiment status to "published" and set up and end time. (Published until)

## Collecting Data
        Coming up