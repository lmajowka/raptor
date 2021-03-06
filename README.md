# Raptor A/B Tests v0.101

[![Code Climate](https://codeclimate.com/github/lmajowka/raptor/badges/gpa.svg)](https://codeclimate.com/github/lmajowka/raptor)

Raptor is an A/B Tests management tool written in Ruby on Rails that generates a javascript file responsible for running the tests.
This means you can use Raptor A/B Tests in your application regardless of your server side configuration and even if your whole page is delivered by a CDN

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

4. Testing in development:

   In your website's head, place the tag

        <script src="http://localhost:3000/js.js"></script>

   The tests should start running if the file is properly loaded

5. Access root ( http://localhost:3000/ ) with (user: testuser, password: testpass )

        Define experiments and variations, play with the dashboard is pretty straight forward ( I hope :) )

## Playing on production

1. Deploy your raptor application to a server ( I recommend heroku, it's a good place to start )

2. Run migrations

3. Set up ENV vars

           $ heroku config:set HTTP_USER=username HTTP_PASS=password

4. In your website's head, use the tag with you raptor's app domain

        <script src="http://yourraptorappdomain.com/js.js"></script>

5. Use the parameters  seedrafts and forceVersion to check that the experiment is well configured

        http://appdomain.com/my-landing-page?seedrafts&forceversion=6

6. Change your experiment status to "published" and set up and end time. (Published until)

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