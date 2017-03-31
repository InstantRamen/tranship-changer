require "sinatra"
require "./tranship_changer.rb"

set :public_folder, File.dirname(__FILE__) + '/static'

pro_numbers = %q{
1234567
1113344
2222333
2333455
}

def split!(string)
  res = []
  string.split("\n").each do |line|
    res << line if line.length > 1
  end
  res
end

def change_tranships(pros_string, tranships)
  pros = []
  tranships ||= "kearny"
  pros_string.split(/(?:\n\r?|\r\n)/).each do |pro|
    pros << pro if pro.length > 1
  end
  tranship_changer = TranshipChanger.new(pros)
  tranship_changer.append_tranships(tranships)
end
# result = change_tranships(pro_numbers, "kearny")
# puts result

get "/" do
  if params["pros"]
    pros = params["pros"]
    #.gsub (/\r\n?/, "\n")
    pros.gsub!(/\r\n?/, "\n")
    result = change_tranships(pros, params["tranship"])
  end
  erb(:index, locals: {result: result})
end