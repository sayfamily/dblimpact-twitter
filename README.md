TwitterApp
==========
TwitterApp is a very basic Rails 3 application that demonstrates how to use the
[Sign in with Twitter](http://dev.twitter.com/pages/sign_in_with_twitter)
workflow with version 1.x of the [twitter
gem]
Installation
------------
    git clone git@github.com:sayfamily/dblimpact-twitter.git
    cd twitter-app
    bundle install

Usage
-----
Using TwitterApp requires you to [register an app with
Twitter](http://dev.twitter.com/apps) to obtain OAuth credentials. Once you
obtain credentials, substitute your consumer key and secret into the command
below.

    CONSUMER_KEY=abc CONSUMER_SECRET=123 rails server
