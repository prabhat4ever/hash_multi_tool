require 'spec_helper'

describe HashMultiTool do
	it 'has a version number' do
		expect(HashMultiTool::VERSION).not_to be nil
  end

  describe ".sort_by_order" do
    it "It should return a blank array if both the params are blank" do
      sort_arr_hash = HashMultiTool.sort_by_order [], []
      sort_arr_hash.should == []
      sort_arr_hash.size.should == 0
    end

    it "It should return a blank array if the array of hash is empty" do
      sort_arr_hash = HashMultiTool.sort_by_order [], ['foo', 'bar']
      sort_arr_hash.should == []
      sort_arr_hash.size.should == 0
    end

    it "It should return a array of hash as it is with incorrect sort by keys" do
      sort_arr_hash = HashMultiTool.sort_by_order ARR_HASH_ONE, ['alpha', 'tango']
      sort_arr_hash.should == ARR_HASH_ONE
    end

    it "It should return a sorted array of hash as per the passed array of keys" do
      sort_arr_hash = HashMultiTool.sort_by_order ARR_HASH_ONE, ['bar', 'foo']
      sort_arr_hash.first.should == {"foo"=>2, "bar"=>1}
      sort_arr_hash.last.should == {"foo"=>3, "bar"=>4}
    end

    it "It should return a sorted array of hash as per the passed array of symbolized keys" do
      sort_arr_hash = HashMultiTool.sort_by_order ARR_HASH_TWO, [:foo, :bar]
      sort_arr_hash[0].should == {:foo=>"a", :bar=>1}
      sort_arr_hash[1].should == {:foo=>"a", :bar=>4}
    end

    it "It should return a sorted array of hash as per the single sorty by key" do
      sort_arr_hash = HashMultiTool.sort_by_order ARR_HASH_TWO, [:foo]
      sort_arr_hash.first.should == {:foo=>"a", :bar=>4}
      sort_arr_hash.last.should == {:foo=>"d", :bar=>2}
    end

    it "It should return a sorted array of hash as per the single sorty by key and DESC direction" do
      sort_arr_hash = HashMultiTool.sort_by_order ARR_HASH_TWO, [:foo], 'DESC'
      sort_arr_hash.first.should == {:foo=>"d", :bar => 2}
      sort_arr_hash.last.should == {:foo=>"a", :bar => 1}
    end

    it "It should return a sorted array of hash as per the single sorty by key and DESC direction" do
      sort_arr_hash = HashMultiTool.sort_by_order ARR_HASH_TWO, [:bar], 'DESC'
      sort_arr_hash.first.should == {:foo=>"a", :bar => 4}
      sort_arr_hash.last.should == {:foo=>"a", :bar => 1}
    end
	end

  describe ".select_by_key_value" do
    it "should return empty array if passed key is not available in the hash set" do
      hash_array = HashMultiTool.select_by_key_value ARR_HASH_TWO, :jango, 4
      hash_array.should == []
    end

    it "should return empty array if passed value is not available in the hash set" do
      hash_array = HashMultiTool.select_by_key_value ARR_HASH_TWO, :bar, 100
      hash_array.should == []
    end

    it "should return proper an array of matched values" do
      hash_array = HashMultiTool.select_by_key_value ARR_HASH_ONE, 'bar', 4
      hash_array.count == 2
      hash_array.first.should == { 'foo'=>3,'bar'=>4 }

      hash_array = HashMultiTool.select_by_key_value ARR_HASH_TWO, :bar, 4
      hash_array.count == 2
      hash_array.last.should == { foo: 'b', bar: 4 }
    end
  end

  describe ".collect_keys" do
    it "should return all the available keys from a hash including subset hash" do
      hash = {"World" => "Region", "Country" => [{"Name" => "India", "Capital" => "Delhi"}, {"Name" => "England", "Capital" => "London"}]}
      hash_keys = HashMultiTool.collect_keys hash
      hash_keys == ["World","Country","Name","Capital","Name","Capital"]
      hash_keys.uniq == ["World","Country","Name","Capital"]
    end
  end

  describe ".transpose_to_hash" do
    it "should merge the keys and with collected values belongs to respective keys and return a single hash" do
      arr = [{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2}]
      hash_keys = HashMultiTool.transpose_to_hash arr
      hash_keys == {:a=>[1, 1, 1, 1], :b=>[2, 2, 2, 2], :c=>[3, 3, 3]}
    end
  end

  describe ".transpose_to_array" do
    it "Return a collection of keys differentiated with values" do
      hash = {:a=>[1, 1, 1, 1], :b=>[2, 2, 2, 2], :c=>[3, 3, 3]}
      hash_keys = HashMultiTool.transpose_to_array hash
      hash_keys == [{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2, c:3},{a:1, b:2}]
    end
  end

  describe ".sort_desc" do
    it "should sort the hash based on value in desc order" do
      hash = {a: 500, b: 1000, c: 1500}
      expect((HashMultiTool.sort_desc hash).to_a.first.last).to eq(1500)
    end

    it "should return blank hash if blank hash is passed" do
      expect(HashMultiTool.sort_desc Hash.new).to eq({})
    end
  end

  describe ".sort_asc" do
    it "should sort the hash based on value in asc order" do
      hash = {a: 500, b: 1000, c: 1500}
      expect((HashMultiTool.sort_asc hash).to_a.first.last).to eq(500)
    end

    it "should return blank hash if blank hash is passed" do
      expect(HashMultiTool.sort_asc Hash.new).to eq({})
    end
  end

  describe ".values_to_percentage" do
    it "should return correct percentages based on sum of all values" do
      hash = {a: 500, b: 1000, c: 1500}
      expect(HashMultiTool.values_to_percentage hash).to eq({a:16.67,b:33.33,c:50.0})
    end

    it "should return valid message incase input hash values are not numbers or decimal" do
      hash = {a: 500, b: 'string', c: :symbol}
      expect(HashMultiTool.values_to_percentage hash).to eq('Percentage can only be calculated for numbers or decimals')
    end

  end

end
