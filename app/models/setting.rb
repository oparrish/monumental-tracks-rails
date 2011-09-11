class Setting < ActiveRecord::Base
	validates_presence_of :key
	validates_presence_of :value
	validates_uniqueness_of :key
end
