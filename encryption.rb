# encoding: utf-8
# Программа, которая шифрует введённое пользователем слово
# одним из механизмов MD5 или SHA1

require 'digest'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите слово или фразу для шифрования:"
phrase = STDIN.gets.encode('UTF-8').chomp
puts
puts "Каким способом зашифровать:"
puts "1. MD5"
puts "2. SHA1"
puts "3. SHA2"
encryption_id = STDIN.gets.to_i
puts
puts "Вот что получилось:"

if encryption_id == 1
  puts "#{Digest::MD5.hexdigest(phrase)}"
elsif encryption_id == 2
  puts "#{Digest::SHA1.hexdigest(phrase)}"
elsif encryption_id == 3
  puts "#{Digest::SHA2.hexdigest(phrase)}"
else
  puts "Вы ввели недопустимое значение"
end