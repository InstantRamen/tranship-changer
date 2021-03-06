class TranshipChanger 
  @pros = []
  @@valid_tranships = {
    kearny:     "803,885",
    tomsbrook:  "803,679,885",
    mansfield:  "803,779,776",
    austintown: "803,776",
    berea:      "803,650"
  }

  def initialize(pros)
    @pros = pros
  end

  def validate_tranship(tranship_string)
    # remove spaces and downcase
    tranship_string.gsub!(/\s+/, "")
    tranship_string.downcase!
    if @@valid_tranships[tranship_string.to_sym]
      @@valid_tranships[tranship_string.to_sym]
    elsif tranship_string == "" || !tranship_string
      @@valid_tranships[:mansfield]
    else
      tranship_string
    end
  end

  def append_tranships(tranship_string)
    tranships = validate_tranship(tranship_string)
    result = ""
    @pros.each do |pro|
      result << "#{pro} \n2 \n#{tranships} \n\r \n\r \n\r \n\r"
    end
    result
  end
end