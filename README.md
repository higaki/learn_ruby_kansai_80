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

[回答例](https://github.com/higaki/learn_ruby_kansai_80/blob/master/ex1.rb)


### 演習問題2
BMI を計算するメソッドを追加しよう。  

    BMI = 体重[kg] / (身長[m] ** 2)

[回答例](https://github.com/higaki/learn_ruby_kansai_80/blob/master/ex2.rb)


### 演習問題3
Person#<=> を書き直そう。  
その妥当な仕様は?

````ruby
p0 = Person.new('matz')
p1 = Person.new('Matz', Time.local(1965, 4, 14))

p0 <=> p1   # => ?
````

[回答例](https://github.com/higaki/learn_ruby_kansai_80/blob/master/ex3.rb)

* `@name` と `@born` を比較対象の属性とする。
* `@name` は、大文字/小文字を区別しない。
* 比較対象が `Person` でなければ `nil` を返す。


### 演習問題4
Person#=== を定義しよう。  
その妥当な仕様は?

````ruby
p0 = Person.new('matz')
p1 = Person.new('Matz', Time.local(1965, 4, 14))

p0 === p1   # => ?
````

[回答例](https://github.com/higaki/learn_ruby_kansai_80/blob/master/ex4.rb)

* `===` は `==` に比べて ゆるい 比較を行う。
* `@name` のみを対象の属性とする。
* `@name` は、大文字/小文字を区別しない。
* 比較対象が `Person` でなければ、そのオブジェクトの文字列形式と比較する。
