require_relative 'ex2'

class Person
  def === o
    case o
    when Person; @name.upcase === o.name.upcase
    else         @name.upcase === o.to_s.upcase
    end
  end
end

if $0 == __FILE__
  matz = Person.new('matz', Time.local(1965,  4, 14))
  dhh  = Person.new('dhh',  Time.local(1979, 10, 15))

  Person === matz               # => true

  matz_only_name  = Person.new('matz')
  matz_capitalize = Person.new('Matz', Time.local(1965, 4, 14))
  matz_young      = Person.new('matz', Time.local(2000, 4, 14))
  matz_fat        = Person.new('matz', Time.local(1965, 4, 14))
  matz_fat.weight = 99

  matz === matz_only_name       # => true
  matz === matz_capitalize      # => true
  matz === matz_young           # => true
  matz === matz_fat             # => true
  matz === 'matz'               # => true

  matz === dhh                  # => false
end
