class TranshipChanger
  @pros = []
  @@valid_tranships = {
    kearny:    "803,679,885",
    tomsbrook: "803,679,885",
    mansfield: "803,779,776"
  }
  def initialize(pros)
    @pros = pros
  end

  def append_tranships(tranship_string)
    tranship_string.downcase!
    if @@valid_tranships[tranship_string.to_sym]
      tranships = @@valid_tranships[tranship_string.to_sym]
    else
      tranships = tranship_string
    end
    result = ""
    @pros.each do |pro|
      result << "#{pro} \n2 \n#{tranships} \n \n \n"
    end
    result
  end
end