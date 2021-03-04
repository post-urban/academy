
class Fire
  def mean
    puts self
    puts "火"
  end
end

module Company
  class Fire
    def mean
      puts self
      puts "解雇"
    end
  end
end

Fire.new.mean
# => #<Fire:0x00007febf99206c0>
# => 火

Company::Fire.new.mean
# => #<Company::Fire:0x00007febf9920530>
# => 解雇
