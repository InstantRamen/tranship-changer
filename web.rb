require "sinatra"
require "sinatra/reloader"
require "./tranship_changer.rb"

set :public_folder, File.dirname(__FILE__) + '/static'

def change_tranships(pros_string, tranships)
  pros = []
  tranships ||= "kearny"
  pros_string.split(/(?:\n\r?|\r\n)/).each do |pro|
    pros << pro if pro.length > 1
  end
  tranship_changer = TranshipChanger.new(pros)
  tranship_changer.append_tranships(tranships)
end

get "/" do
  if params["pros"]
    pros = params["pros"]
    pros.gsub!(/^\s*$/, "")
    pros.gsub!(/\r\n?/, "\n")
    result = change_tranships(pros, params["tranship"])
  end
  erb(:index, locals: {result: result})
end