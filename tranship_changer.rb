class TranshipChanger
  @pros = []
  def initialize(pros)
    @pros = pros
  end

  def append_tranships(tranship_string)
    result = ""
    @pros.each do |pro|
      result << "#{pro} \n2 \n#{tranship_string} \n \n \n"
    end
    result
  end
end