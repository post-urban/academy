
class Alphabet

  private

  def method_missing(name, *args)
    if (:a..:z).include?(name)
      puts "#{name} from method_missing"
      return
    end

    super
  end
 end

 Alphabet.new.a
 # => a from define_method
 
 Alphabet.new.b
 # => b from define_method
 
 Alphabet.new.z
 # => z from define_method



class Enum
  def initialize(list)
    @list = list
  end

  def current(value)
    if @list.include?(value.to_sym)
      @current = value.to_sym
    else
      @current = @list .first
    end
  end

  private

  def method_missing(method_name, *arguments)
    if method_name[-1] != '?'
      super
      return
    end

    return @current == method_name[0..-2].to_sym
  end
 end


 env = Enum.new([:production, :test, :development])

 env.current(:production)
 puts env.production?
 # => true

 puts env.development?
 # => false

 env.current(:development)
 puts env.production?
 # => false

 puts env.development?
 # => true



 gender = Enum.new([:male, :female])

 gender.current(:male)
 puts gender.male?
 # => true

 puts gender.female?
 # => false
 