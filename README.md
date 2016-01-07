Environment setup
=================

External environment
--------------------
* Install rbenv
* Install rbenv-install
* Use rbenv to install stable MRI ruby
* Install bundler:


    echo 'gem: --no-document' >> ~/.gemrc
    gem install bundler

* Install node:


    sudo apt-get install nodejs
    sudo ln -s /usr/bin/nodejs /usr/local/bin/node

* Install npm:


    sudo apt-get install npm
    sudo npm install -g npm

* Install jspm:


    sudo apt-get install -g jspm


Development
-----------

    git clone git@github.com:Infogroep/lanparty-website-2016.git
    cd lanparty-website-2016
    bundle install
    rake db:setup

    pushd public/javascripts
    npm install
    jspm install
    popd

    rails s
