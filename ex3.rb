require_relative 'ex2'

class Person
  def <=> o
    case o
    when Person
      [@name.upcase, @born] <=> [o.name.upcase, o.born]
    else
      nil
    end
  end
end

if $0 == __FILE__
  matz = Person.new('matz', Time.local(1965, 4, 14))

  matz_only_name  = Person.new('matz')
  matz_capitalize = Person.new('Matz', Time.local(1965, 4, 14))
  matz_young      = Person.new('matz', Time.local(2000, 4, 14))
  matz_fat        = Person.new('matz', Time.local(1965, 4, 14))
  matz_fat.weight = 99

  matz <=> matz_only_name       # => nil
  matz <=> matz_capitalize      # => 0
  matz <=> matz_young           # => -1
  matz <=> matz_fat             # => 0
  matz <=> 'matz'               # => nil
end
