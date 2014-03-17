# Mayhem

Text data making too much sense? Unleash Mayhem on it!

## Installation

Add this line to your application's Gemfile:

    gem 'mayhem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mayhem

## Usage

First off, require Mayhem:

    require 'mayhem'

Now, when you want to synonymize a string, just pass it through Mayhem's synonymizer:

    your_string = 'Synonym: a word or phrase that means exactly or nearly the same as another word or phrase in the same language, for example shut is a synonym of close.'

    Mayhem.synonymize(your_string)
    => "Synonym: a tome or musical that canvass all or noways the nonetheless as another trade or musical in the notwithstanding language, type example toggle expanding a Doppelganger of close."

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
