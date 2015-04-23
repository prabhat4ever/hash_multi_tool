# HashMultiTool

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hash_multi_tool`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_multi_tool'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_multi_tool

## Usage

	ARR_HASH = [{ foo: 'a', bar: 4 },
    { foo: 'b', bar: 3 },
    { foo: 'c', bar: 1 },
    { foo: 'b', bar: 4 }]
			
  1) HashMultiTool.sort_by_order ARR_HASH, [:bar, :foo]

	  Note: By default it will sort in ASC order
	  
	  If you Want to sort in DESC order. 

	  HashMultiTool.sort_by_order ARR_HASH, [:bar, :foo], "DESC"

  2) Find array of hashes of matched key values :-

	  HashMultiTool.select_by_key_value ARR_HASH_ONE, :bar, 4  
	  
	  => [{ foo: 'a', bar: 4 }, { foo: 'b', bar: 4 }]

	3) Return all the available keys from a hash including subset hash
		hash = {"World" => "Region", "Country" => [{"Name" => "India", "Capital" => "Delhi"}, {"Name" => "England", "Capital" => "London"}]}
		=> ["World","Country","Name","Capital","Name","Capital"]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hash_multi_tool/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
