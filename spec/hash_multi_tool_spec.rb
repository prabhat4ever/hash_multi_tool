require 'spec_helper'

describe HashMultiTool do
  it 'has a version number' do
    expect(HashMultiTool::VERSION).not_to be nil
  end

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
