$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hash_multi_tool'

ARR_HASH_ONE = [{ 'foo'=>3,'bar'=>4 },
			   { 'foo'=>2,'bar'=>3 },
			   { 'foo'=>1,'bar'=>2 },
			   { 'foo'=>4,'bar'=>1 },
			   { 'foo'=>2,'bar'=>1 },
			   { 'foo'=>1,'bar'=>3 },
			   { 'foo'=>2,'bar'=>4 }]

ARR_HASH_TWO = [{ foo: 'a', bar: 4 },
			   { foo: 'b', bar: 3 },
			   { foo: 'c', bar: 1 },
			   { foo: 'b', bar: 4 },
			   { foo: 'd', bar: 2 },
			   { foo: 'c', bar: 3 },
			   { foo: 'a', bar: 1 },]
