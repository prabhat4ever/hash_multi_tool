require "hash_multi_tool/version"

module HashMultiTool
  class << self
	  def sort_by_order hash = [], order = [], direction ='ASC'
	    hash.sort do |a,b|
	      a_arr = []
	  	  b_arr = []
	      order.each{|key| a_arr << a[key]; b_arr << b[key];}
	      direction.downcase == "desc" ? b_arr <=> a_arr : a_arr <=> b_arr 
	  	end
	  end

	  def select_by_key_value hash = [], key = [], value = nil
	  	hash.select { |h| h[key] == value }
	  end

	  def collect_keys h_object
		  if h_object.is_a? Hash
		    (h_object.keys + collect_keys(h_object.values)).flatten.uniq
		  elsif h_object.is_a? Array 
		    h_object.collect{|value| collect_keys value}
		  else
		    []
		  end
		end

		def transpose_to_hash arr = []
			arr.inject({}){|a, h| 
				h.each_pair{|k,v| (a[k] ||= []) << v}
				a
			}
		end

		def transpose_to_array hash = {}
			hash.inject([]){|a, (k,vs)| 
			  vs.each_with_index{|v,i| (a[i] ||= {})[k] = v} 
			  a
			}
		end
	end
end
