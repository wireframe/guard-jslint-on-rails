Guard::JslintOnRails 
=============

Guard plugin to verify that Javascript files comply with [JSLint](http://www.jslint.com/) validations.


Install
-------

Install and configure the [JSLint on Rails](https://github.com/psionides/jslint_on_rails) gem.

Install the gem:

    $ gem install guard-jslint-on-rails

Add it to your Gemfile (inside development group):

``` ruby
gem 'guard-jslint-on-rails'
```

Add guard definition to your Guardfile by running this command:

    $ guard init jslint-on-rails

Configuration
-------------

``` ruby
# Guardfile
guard 'jslint-on-rails' do
  # watch for changes to application javascript files
  watch(%r{^app/assets/javascripts/.*\.js$})
  # watch for changes to the JSLint configuration
  watch('config/jslint.yml')
end
```

### Configuration Options

```ruby
# Guardfile
guard 'jslint-on-rails', :config => '/path/to/jslint.yml' do
end

:config - path to jslint.yml config file. default is config/jslint.yml
```

Please read [Guard doc](https://github.com/guard/guard#readme) for more information about the Guardfile DSL.
