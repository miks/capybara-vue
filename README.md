capybara-vue
============

Stable integration tests for Vue.js with Capybara.

Influenced by [Capybara::Angular](https://github.com/wrozka/capybara-angular).

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'capybara-angular'
```

Usage
-----

Use it as you would use regular Capybara API, however this time, you won't face any race conditions when working with Vue.js applications.

```ruby
include Capybara::Vue::DSL
```
