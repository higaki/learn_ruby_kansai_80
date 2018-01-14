require_relative 'ex1'

class Person
  def bmi
    @weight / (@height / 100.0) ** 2
  end
end

if $0 == __FILE__
  kazuhiko= Person.new('kazuhiko', Time.local(1972, 5, 8))
  kazuhiko.height = 188
  kazuhiko.weight =  59

  kazuhiko.bmi                  # => 16.693073789044817
end
