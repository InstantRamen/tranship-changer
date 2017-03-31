require("./tranship_changer.rb")

pro_numbers = %q{
1234567
1113344
2222333
2333455
}

pros = pro_numbers.split("\n")
tranship_changer = TranshipChanger.new(pros)
final = tranship_changer.append_tranships("803,779,776")
puts final