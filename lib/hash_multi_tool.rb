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

		def sort_desc hash
			Hash[hash.sort_by {|k, v| -v}]
		end

		def sort_asc hash
			Hash[hash.sort_by {|k, v| v}]
    end

    def values_to_percentage hash
      if (hash.values.map{|val| val.is_a? Fixnum || Float }).all? {|boolean| boolean == true}
        sum = hash.values.inject 0, :+
        hash.each { |k,v| hash[k] = (v*100/sum.to_f).round(2) }
      else
        'Percentage can only be calculated for numbers or decimals'
      end
    end

	end
end
