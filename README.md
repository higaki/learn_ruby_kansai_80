# Ruby初級者向けレッスン 64回
## クラス

### 演習問題1
属性として身長と体重を追加しよう。  
体重は秘密にしよう。

````ruby
require_relative 'person'

class Person
  ...
````

### 演習問題2
BMI を計算するメソッドを追加しよう。  

    BMI = 体重[kg] / (身長[m] ** 2)


### 演習問題3
Person#<=> を書き直そう。  
その妥当な仕様は?

````ruby
p0 = Person.new('matz')
p1 = Person.new('Matz', Time.local(1965, 4, 14))

p0 <=> p1   # => ?
````

### 演習問題4
Person#=== を定義しよう。  
その妥当な仕様は?

````ruby
p0 = Person.new('matz')
p1 = Person.new('Matz', Time.local(1965, 4, 14))

p0 === p1   # => ?
````
