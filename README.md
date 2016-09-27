
# Introduction

This is my personal project to keep track on my learning progress of Ruby on Rails.
Currently I am following the Ruby on Rails tutorial book by Michael Hartl.
See link: https://www.railstutorial.org/book/

##
Instructions to Setup Rails project


### Install GPG
RVM will be halt and cannot be installed if GPG is not being installed first.
```
brew intall GPG
```

Install the security key for RVM
```
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
```

### Install RVM

Run command:

```
\curl -L https://get.rvm.io | bash -s stable
```

Close and reopen terminal:
```
source ~/.rvm/scripts/rvm
```

### Install Ruby

Install Ruby 2.3.1
```
rvm install ruby-2.3.1
```

### Check the Gem Manager

Run command to check the current version of gem installed:
```
gem -v 
```

Run command to update to latest gem version
```
gem update --system
```

### RVM Global Gemset

Display a list of gemset:
```
rvm gemset list
```

Use Global gemset
```
rvm gemset use global
```

Ignore on installing documentation for gems for faster installation
```
echo "gem: --no-document" >> ~/.gemrc
```

### Install other required Gem

``` 
gem install bundler
gem install nokogiri
```

### Install Rails

Make a gemset for current stable release
```
rvm use ruby-2.3.1@rails5.0 --create
```

Run install Rails
```
gem install Rails
```

Run install rails on a specific version
```
gem install rails --version=3.2.18
```

### Create new rails application

#### Setup a project specific gemset
```
rvm use ruby-2.3.1@myapp --ruby-version --create
gem install rails
```
Note: the new gemset will be empty so we need to run command ```gem install rails``` to install the most recent release of rails

#### Optional: Add a gemset for existing application

Follow the instructions above and run ``` bundle install ``` 

#### Create rails project

```
rails new myapp
```

In below are the list of chapters I have completed while going through the book and working on the app examples.

# Chapters completed

* Chapter 1: From Zero to Deploy
* Chapter 2: Toy app
