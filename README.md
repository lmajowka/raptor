# Raptor A/B Tests v0.101

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

3.  Requirements:

   Client side:

        jQuery > 1.4

   Server:

        Rails, database no mystery

4. Checking in development:

   In your website's head, place the tag

        <script src="http://localhost:3000/js.js"></script>

   The tests should start running

## Playing on production

1. Deploy your raptor application to a server ( I recommend heroku, it's a good place to start )

2. in your website's head, use the tag with you raptor's app domain

        <script src="http://yourraptorappdomain.com/js.js"></script>

3. Use the parameters  seedrafts and forceVersion to check that the experiment is well configured

        http://appdomain.com/my-landing-page?seedrafts&forceversion=6

4. Change or experiment status to "published" and set up and end time. (Published until)

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Collecting Data

        Coming up

## Roadmap

        - Data collection with Google Analytics or custom
        - Experiments / country
        - Javascript rules to evaluate before applying a variation

## License

[BSD License](https://github.com/lmajowka/raptor/blob/master/LICENSE) © 2015 - Leonardo Majowka