require "hash_multi_tool/version"

module HashMultiTool
  def self.sort_by_order hash = {}, order = [], direction ='ASC'
    hash.sort do |a,b|
      a_arr = []
  	  b_arr = []
      order.each{|key| a_arr << a[key]; b_arr << b[key];}
      direction.downcase == "desc" ? b_arr <=> a_arr : a_arr <=> b_arr 
  	end
  end
end
