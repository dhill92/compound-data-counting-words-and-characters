file_path = File.join(File.dirname(__FILE__), 'tale_of_two_cities.txt')
story_contents = File.read(file_path)

# what are the 3 most frequently used words?
downcased_contents = story_contents.downcase

stripped_contents = downcased_contents.gsub(",","").gsub("-","").gsub(".","")

words = stripped_contents.split(" ")

word_frequencies = {}

words.each do |word|
  if word_frequencies[word].nil?
    word_frequencies[word] = 0
  end
  word_frequencies[word] += 1
end

length_to_word_map = {}
word_frequencies.each do |word, count|
  if length_to_word_map[count].nil?
    length_to_word_map[count] = []
  end
  length_to_word_map[count] << word
end

word_count = 0
sorted_frequencies = length_to_word_map.sort.reverse
sorted_frequencies.each do |frequency|
  if word_count <= 2
  frequency[1].each do |word|
    puts word
    word_count += 1
  end
end
end

#puts length_to_word_map.sort


# how many times do all of the vowels appear?
# target data structure = {
# 'a' => 1
#}
characters = stripped_contents.split('')

vowel_frequencies = {}

characters.each do |character|
  if character == 'a' || character == 'e' || character == 'i' ||  character == 'u' || character == 'o'
    if vowel_frequencies[character].nil?
      vowel_frequencies[character] = 0
    end
    vowel_frequencies[character] += 1
  end
end

sorted_vowels = vowel_frequencies.invert.sort

sorted_vowels.each do |frequency, character|
  puts "there are #{frequency} #{character}'s"
end


#owel_frequencies.invert.reverse.sort
# what is the most frequently used vowel?

max = -1
max_character = ''
vowel_frequencies.each do |character, frequency|
  if frequency > max
    max = frequency
    max_character = character
  end
end

puts "#{max_character} is the most frequently used vowel"
# what is the average vowel frequency?
sum = 0
vowel_frequencies.values.each do |frequency|
  sum += frequency
end
puts "#{sum / vowel_frequencies.values.size.to_f} is the average frequency"

vowel_frequencies.values.inject(0) do |sum, frequency|
  sum += frequency
end
# how many occurrences of specific punctuation marks are there?
punctuation = [
  "-",
  ",",
  "."
]

punctuation_frequency = {}
downcased_contents.split("").each do |char|
  punctuation.each do |mark|
    if mark == char
    if punctuation_frequency[mark].nil?
      punctuation_frequency[mark] = 0
    end
    punctuation_frequency[mark] += 1
    end
  end
end

puts punctuation_frequency.inspect
