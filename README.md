[![Code Climate](https://codeclimate.com/github/JonRowe/pr.png)](https://codeclimate.com/github/JonRowe/pr)

PR  :: PublicRelations
======================

`PR` is a gem for handling user input with forms. The idea is to decouple
the logic of handling user input, the process of parsing what is
essentially raw string data into valid Ruby data, (via 'typecasting/parsing' 
and validation), from the buisness logic and persistance of an application.

I am building it with the principle of seperating concerns and not mixing
things into the form objects as much as possible, I'd like the library to
be usuable without any mixins, but will also provide mixinable macros for
ease of usage.

## Installation

Add this line to your application's Gemfile:

    gem 'pr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo_adaptor

## Usage

In general

    require 'pr'

will require the form helper macros, field definitions and if `Rails` is
defined require the `ActiveForm` helper macro which allows the inclusion
of `ActiveModel` compliance into the forms you define.

You can also manually require the 3 main elements as you desire.

## Caveats

Work in progress.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
