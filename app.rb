require "sinatra/base"
require "./tranship_changer.rb"

class App < Sinatra::Base
  set :bind, ENV['IP']
  set :port, ENV['PORT']
  
  @pros = []
  @result = "nothing is here..."
  
  set :public_folder, File.dirname(__FILE__) + '/static'

  def change_tranships(pros_string, tranships)
    pros = []
    pros_string.split(/(?:\n\r?|\r\n)/).each do |pro|
      pros << pro if pro.length > 1
    end
    tranship_changer = TranshipChanger.new(pros)
    tranship_changer.append_tranships(tranships)
  end

  get "/" do
    erb(:index, locals: {result: @result})
  end

  post "/" do
    if params["pros"]
      @pros = params["pros"]
      @pros.gsub!(/^\s*$/, "")
      @pros.gsub!(/\r\n?/, "\n")
      @result = change_tranships(@pros, params["tranship"])
    end
    erb(:index, locals: {result: @result})
  end

  run!
end
