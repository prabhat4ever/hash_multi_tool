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
			
  1) HashMultiTool.sort_by_order ARR_HASH, [:bar, :foo] :-

	  Note: By default it will sort in ASC order
	  
	  If you Want to sort in DESC order. 

	  HashMultiTool.sort_by_order ARR_HASH, [:bar, :foo], "DESC"

  2) Find array of hashes of matched key values :-

	  HashMultiTool.select_by_key_value ARR_HASH, :bar, 4  
	  
	  => [{ foo: 'a', bar: 4 }, { foo: 'b', bar: 4 }]

3) Return all the available keys from a hash including subset hash :-
	
	hash = {"World" => "Region", "Country" => [{"Name" => "India", "Capital" => "Delhi"}, {"Name" => "England", "Capital" => "London"}]}
	hash_keys = HashMultiTool.collect_keys hash
	=> ["World","Country","Name","Capital","Name","Capital"]
	
	hash_keys.uniq 
	=> ["World","Country","Name","Capital"]

4) Merge the keys and with collected values belongs to respective keys and return a single hash
	
	arr = [{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2}]
	 	
	hash_keys = HashMultiTool.transpose_to_hash arr
	 	
	=> {:a=>[1, 1, 1, 1], :b=>[2, 2, 2, 2], :c=>[3, 3, 3]}

 5) Return a collection of keys differentiated with values
	
	hash = {:a=>[1, 1, 1, 1], :b=>[2, 2, 2, 2], :c=>[3, 3, 3]}
	 	
	hash_keys = HashMultiTool.transpose_to_array hash
	 	
	=> [{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2}]
	
 6) Sort a hash by value in ascending order:
 
    hash = {a: 1000, b: 500, c: 1500}
 	
    HashMultiTool.sort_asc hash
    
    => {:a=>500, :b=>1000, :c=>1500}
    
 7) Sort a hash by value in descending order:
 
    hash = {a: 1000, b: 500, c: 1500}
 	
    HashMultiTool.sort_desc hash
    
    => {:c=>1500, :b=>1000, :a=>500}
    
 8) Convert values of hash to percentage based on sum of values
 
    hash = {a: 20, b: 20}
    
    HashMultiTool.values_to_percentage hash
    
    => {:a=>50.0, :b=>50.0}
 	
 	
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hash_multi_tool/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
