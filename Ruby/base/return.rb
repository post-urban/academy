

puts "================ upcase_add ================"
def upcase_add(str1, str2)
  upcase_str1 = str1.upcase
  upcase_str2 = str2.upcase
  upcase_str1 + "_" + upcase_str2 # ここが最終行なのでこの式の評価値が返り値として返却される
end

puts upcase_add("pre", "post") # => "PRE_POST"



puts "================ capitalize_add ================"
def capitalize_add(str1, str2)
  return "Error" if str1.size == 0
  return "Error" if str2.size == 0

  cap_str1 = str1.capitalize
  cap_str2 = str2.capitalize
  cap_str1 + "_" + cap_str2 # 上でreturnされない場合ここが最終行として評価される
end

puts capitalize_add("pre", "post") # => "Pre_Post"
puts capitalize_add("", "post") # => "Error"