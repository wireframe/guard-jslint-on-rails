Guard::JslintOnRails 
=============

Guard plugin to verify that Javascript files comply with [JSLint](http://www.jslint.com/) validations.


Install
-------

Install and configure the [JSLint on Rails](https://github.com/psionides/jslint_on_rails) gem

Install the gem:

    $ gem install guard-jslint-on-rails

Add it to your Gemfile (inside development group):

``` ruby
gem 'guard-jslint-on-rails'
```

Add guard definition to your Guardfile by running this command:

    $ guard init guard-jslint-on-rails

Configuration
-------------

``` ruby
# Guardfile
guard 'jslint-on-rails' do
  # watch for changes on any of your application javascript files
  watch(%r{^app/assets/javascripts/.*\.js$})
  # watch for changes to the JSLint configuration
  watch('config/jslint.yml')
end
```

Please read [Guard doc](https://github.com/guard/guard#readme) for more information about the Guardfile DSL.
