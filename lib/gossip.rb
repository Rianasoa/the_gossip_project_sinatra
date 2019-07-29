require 'csv'

class Gossip

	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
		
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    		csv << [@author , @content]
  		end
	end

	def self.all
		all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  		return all_gossips

	end

	def self.find(id)
		Gossip.all[id.to_i-1]
	  end

	def self.edit(id,author,content)
		all_gossips = CSV.read("./db/gossip.csv")
		all_gossips[id.to_i-1][0] = author
		all_gossips[id.to_i-1][1] = content
		CSV.open("./db/gossip.csv", 'w+') { |csv| all_gossips.each{|line| csv << line}}
		
	end
end
