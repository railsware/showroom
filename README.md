# Mission Possible: Do something

# Requirements (without coloscouping)

Also, please keep in mind:
We've intentionally made requirements fairly vague to give you freedom of interpretation / coming back.
to us with some follow up questions. You can also look at current Shoedazzle.com web site for some clarifications.
However, whatever you will build doesn't have to resemble current site.

Test assignment

Build an application that has
* users
* users have roles and can be segregated into two groups - regular users and admins
* every regular user has showroom with products
* every regular user gets new showroom every month
* new showrooms are being populated with products by rake task
* every showroom has 10 products
* admins can list, edit, create, and delete products
* every product has name, description, image, and price
* all users can access their showrooms after login

You can use
* any version of ruby and rails
* any gems
* application should have 95-100% test coverage
* application should run on Linux and MacOS
* application should have bootstrap data
* application should have installation instructions

Please do not spend on implementation more than 2-3 days and do not spend your time on nice UI.

We're not looking for particular implementation, so please use your own judgement to build the system. However, all your decisions will be evaluated by reviewers.

# Installation

 * Install rvm [http://beginrescueend.com/](http://beginrescueend.com/), git [http://git-scm.com/](http://git-scm.com/)

        rvm install ruby-1.9.3-p125
        git clone git://github.com/railsware/shoedazzle.git
        cd shoedazzle
        gem install bundler
        bundle
        rake db:migrate
        rake db:seed
        rails s
    
 * Go by url [http://localhost:3000/](http://localhost:3000/)
  
# Tests

For starting tests:

    rake
    
Tests coverage:

    coverage/index.html