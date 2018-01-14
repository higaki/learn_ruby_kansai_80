RUBY_DESCRIPTION # => "ruby 2.4.0preview1 (2016-06-20 trunk 55466) [x86_64-darwin14]"

class Person; end

obj = Person.new          # => #<Person:0x007fec229a8ab0>

obj.class                 # => Person
Person.superclass         # => Object


class Person
  def initialize(name) # !> previous definition of initialize was here
    @name = name
  end
end

matz = Person.new('matz') # => #<Person:0x007fec229a3538 @name="matz">

class Person
  attr_reader :name
end

matz.name                 # => "matz"


class Person
  def initialize(name, born = nil) # !> method redefined; discarding old initialize
    @name, @born = name, born
  end
  attr_accessor :born
end

matz.methods.map(&:to_s).grep(/born/)  # => ["born", "born="]

require 'date'

matz.born = Time.local(1965, 4, 14)
dhh = Person.new('dhh', DateTime.new(1979, 10, 15, 0, 0, 0, "+01:00").to_time)

matz.born                       # => 1965-04-14 00:00:00 +0900
dhh.born                        # => 1979-10-15 00:00:00 +0100


class Person
  def age
    (Time.now.strftime('%Y%m%d').to_i - @born.strftime('%Y%m%d').to_i) / 1_00_00
  end
end

matz.age                        # => 52
dhh.age                         # => 38


matz.to_s                       # => "#<Person:0x007fec229a3538>"

class Person
  def to_s
    "#{@name}(#{age})"
  end
end

matz.to_s                       # => "matz(52)"
dhh.to_s                        # => "dhh(38)"

class Person
  def inspect
    to_s
  end
end

person = Marshal.load(Marshal.dump matz) # => matz(52)

person == dhh                   # => false
person == matz                  # => false


class Person
  include Comparable
  def <=> o
    @name <=> o.name
  end
end

person == dhh                   # => false
person == matz                  # => true
matz > dhh                      # => true


people = [matz, dhh]

people.sort                     # => [dhh(38), matz(52)]


people.sort_by(&:age)           # => [dhh(38), matz(52)]


people.sort{|a, b|b.age <=> a.age} # => [matz(52), dhh(38)]
people.sort_by{|p| -p.age}         # => [matz(52), dhh(38)]
people.sort_by(&:born)             # => [matz(52), dhh(38)]
people.sort_by(&:age).reverse      # => [matz(52), dhh(38)]


h = {matz => "Ruby", dhh => "Rails"}

h[matz]                         # => "Ruby"
h[dhh]                          # => "Rails"

key = Marshal.load(Marshal.dump matz)

key == matz                     # => true
h[key]                          # => nil


class Person
  def hash
    [@name, @born].hash
  end
end

matz.hash                       # => -1438278332225485168
dhh.hash                        # => -4526898111744582066
key.hash                        # => -1438278332225485168


class Person
  def eql? o
    [@name, @born].eql? [o.name, o.born]
  end
end

key.eql? matz                   # => true
key.eql? dhh                    # => false


h.rehash

h[matz]                         # => "Ruby"
h[dhh]                          # => "Rails"

h[key]                          # => "Ruby"
