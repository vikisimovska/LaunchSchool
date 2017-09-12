#GO OVER THIS EXCERCISES DIRECTLY FROM THE LS WEB SITE!!
system("clear")

#1.Make a madlibs program that reads in some text from a text file that you have
# created, and then plugs in a selection of randomized nouns, verbs, adjectives,
# and adverbs into that text and prints it.  Your program should read this text,
# and for each line, it should place random words of the appropriate types into
#the text, and print the result.

#LS SOLUTION
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

def maidlibs(file)
  File.open('madlibs.txt') do |file|
    file.each do |line|
      puts format(line, noun:      NOUNS.sample,
                        verb:      VERBS.sample,
                        adjective: ADJECTIVES.sample,
                        adverb:    ADVERBS.sample)
    end
  end
end
#OTHER SOLUTIONS
def replace_word(word)
  case word
    when "noun" then word.gsub!(word, "#{NOUNS.sample}")
    when "verb" then word.gsub!(word, "#{VERBS.sample}")
    when "adverb" then word.gsub!(word, "#{ADVERBS.sample}")
    when "adjective" then word.gsub!(word, "#{ADJECTIVES.sample}")
    else word
  end
end
#***************************
def has_lib?(text)
  text.include?('%{adjective}') ||
    text.include?('%{adverb}')  ||
    text.include?('%{noun}')    ||
    text.include?('%{verb}')
end

def sub_libs(text)
  new_text = text.sub('%{adjective}', ADJECTIVES.sample)
  new_text = new_text.sub('%{adverb}', ADVERBS.sample)
  new_text = new_text.sub('%{noun}', NOUNS.sample)
  new_text.sub('%{verb}', VERBS.sample)
end

# while has_lib?(text)
#   text = sub_libs(text)
# end
#***************************
#SO NICE AND SIMPLE!!
def madlib(file)
  words = File.readlines("words.txt").map(& :chomp).join(" ").split("SPLIT")
  adj = words[0].split
  noun = words[1].split
  verb = words[2].split
  adv = words[3].split

  madlib = File.readlines("madly.txt").map(& :chomp).join(" ").split
  so_mad = madlib.map do |word|
  case word
    when "ADJ" then adj.sample
    when "NOUN" then noun.sample
    when "VRB" then verb.sample
    when "ADV" then adv.sample
    else
      word
    end
  end
  puts so_mad.join(" ")
end
#**************************
#CHECK THE word.gsub(/\W/, '') HERE..CLEAN THE WORDS (there! who, => there, who)
def madlibs(file)
  str = File.read("test_sample.txt")

  verb = %w(ate swallowed devoured cooked)
  adjective = %w(yummy delicious buttery crispy)
  adverb = %w(mysteriously unexpectedly hopelessly)
  noun = %w(taco pizza masala)

  new_str = str.split.map do |word|
      mod_word = word.gsub(/\W/, '')
      case mod_word
          when "noun" then word.gsub("noun", noun.sample)
          when "adverb" then word.gsub("adverb", adverb.sample)
          when "verb" then word.gsub("verb", verb.sample)
          when "adjective" then word.gsub("adjective", adjective.sample)
          else    word
      end
  end
  #p new_str.join(" ")
end
#***************************
def madlibs(file)
  nouns = ['afterthought', 'downtown', 'observation', 'beginner', 'snail', 'coal',
           'car', 'wind', 'airport', 'insurance', 'morning', 'arithmetic']
  verbs = ['invent', 'whisper', 'scare', 'trouble', 'bang', 'turn', 'boast', 'sin',
           'deceive', 'force', 'launch', 'preserve']
  adjectives = ['mammoth', 'giant', 'spotty', 'boundless', 'thoughtful', 'barbarous',
                'languid', 'chunky', 'dizzy', 'unsightly', 'sore', 'fallacious']
  adverbs = ['sweetly', 'unbearably', 'sedately', 'scarcely', 'roughly', 'yearly',
             'absentmindedly', 'anyway', 'frankly', 'properly', 'justly', 'loftily']

  file = File.open("madlibs.txt", "rb")

  file.each_line do |line|
    line.gsub!('noun', nouns.sample)
    line.gsub!('verb', verbs.sample)
    line.gsub!('adjective', adjectives.sample)
    line.gsub!('adverb', adverbs.sample)
    puts line
  end
end

#**************************

  WORDS = { nouns: %w(cat sleuth dinosaur fridge killer bee turtle ant dog bunny),
            verbs: %w(jumps crumbles pivots smacks fizzles squashes runs hobbles),
            adjectives: %w(smushy rotten purple devilish stinky gold fuzzy hot),
            adverbs: %w(lethargically smartly joyfully quickly harshly slowly) }
def madlib(file)
  story = File.read('madlibs_text.txt').split

  story.map! do |word|
    case
    when word.include?('NOUN') then word.gsub!('NOUN', WORDS[:nouns].sample)
    when word.include?('ADJECTIVE') then word.gsub!('ADJECTIVE', WORDS[:adjectives].sample)
    when word.include?('ADVERB') then word.gsub!('ADVERB', WORDS[:adverbs].sample)
    when word.include?('VERB') then word.gsub!('VERB', WORDS[:verbs].sample)
    else word
    end
  end
end
#************************

  DICTIONARY = {:nouns => ['camera', 'finger', 'cat', 'spaghetti', 'lamp', 'station wagon', 'vine'],
                :adjectives => ['red', 'quiet', 'poor', 'awesome', 'tiny'],
                :verbs => ['runs', 'murders', 'whistles', 'devours'],
                :adverbs => ['slowly', 'loudly', 'eventually', 'immediately']}
def temp_function #erase it if you want to run it
  File.open("madlib.txt") do |file|
      file.each do |line|
        line.gsub!("(noun)", DICTIONARY[:nouns].sample)
        line.gsub!("(adjective)", DICTIONARY[:adjectives].sample)
        line.gsub!("(verb)", DICTIONARY[:verbs].sample)
        line.gsub!("(adverb)", DICTIONARY[:adverbs].sample)
        puts line
    end
  end
  end
  #VERB = %w(spins bites licks hurdles).freeze
  ADV = %w(easily lazily noisily excitedly).freeze
  ADJ = %w(quick lazy sleepy ugly).freeze
  NOUN = %w(fox dog head leg cat tail).freeze


def madlib(file_path)
  file = File.readlines(file_path)

  file.map! do |line|
    words = line.split(" ")
    replace_with_random(words)
  end

  file.each { |line| puts line.join(" ") }
end

def replace_with_random(words)
  words.map! do |word|
    case word
    when /\*verb/ then VERB.sample
    when /\*adv/ then ADV.sample
    when /\*adj/ then ADJ.sample
    when /\*noun/ then NOUN.sample
    else word
    end
  end
end
#******************************
def madlibs(file)
  file = File.read('file.txt')

  madlibs = file.split.map do |word|
    case word.downcase
    when /adjective/ then adjectives.sample
    when /adverb/    then adverbs.sample
    when /verb/      then verbs.sample
    when /noun/      then nouns.sample
    else                  word
    end
  end
  p madlibs.join(' ')
end
#madlib(file_path)

#2.Write a method that displays an 8-pointed star in an nxn grid, where n is an
#odd integer that is supplied as an argument to the method. The smallest such
#star you need to handle is a 7x7 grid.

def star(n)
  arr = []
  1.upto(n/2) do |num|
    arr << '#{ "*" + " "*(num-1) + '*' + " "* (num-1) + '*'}'.center(n)
    #arr <<  output.center(n)
  end
  puts [arr.reverse, "*" * n, arr]
end
#OTHER SOLUTIONS
def see_stars(num)
  arr = []
  (num / 2).times { |n|  arr << "*#{" " * n}*#{" " * n}*".center(num) }
  puts [arr.reverse, "#{"*" * num}", arr]
end
#***************
def star(num)
  lines = (0...num / 2).map { |n| "#{('*' + ' ' * n) * 2}*".center(num) }
  puts [lines.reverse, '*' * num, lines]
end
#***************
def star(n)
  puts (-(n / 2)..n / 2).map { |d| d.zero? ? '*' * n : "#{('*' + ' ' * (d.abs - 1)) * 2}*".center(n) }
end
#star(9)

#3.The transpose of a 3 x 3 matrix is the matrix that results from exchanging the
#columns and rows of the original matrix. Write a method that takes a 3 x 3 matrix
#in Array of Arrays format and returns the transpose of the original matrix.

#each grebs each one of the arrays separatly
def transpose(matrix)
  colum1, colum2, colum3 = [], [], []
  matrix.each do |arr|
    colum1 << arr[0]
    colum2 << arr[1]
    colum3 << arr[2]
  end
  [colum1, colum2, colum3]
end
#similar SOLUTION
def transpose(matrix)
  t1 = []
  t2 = []
  t3 = []
  matrix.map do |a, b, c|
    t1 << a
    t2 << b
    t3 << c
  end
  [t1, t2, t3]
end
#***********OTHER'S SOLUTIONS*************
def transpose(matrix)
  matrix.first.zip(*matrix.drop(1))
end
def transpose(arr)
  arr.map.with_index { |_, idx| [arr[0][idx], arr[1][idx], arr[2][idx]] }
end
def transpose(matrix)
  matrix.each_index.map { |idx| matrix.map { |row| row[idx] } }
end
def transpose(matrix)
  (0..matrix.size - 1).map do |s|
    (0..matrix.size - 1).map do |f|
      matrix[f][s]
    end
  end
end
#further exploration
def transpose!(arr)
  clone = arr.dup
  arr.map!.with_index { |_, idx| [clone[0][idx], clone[1][idx], clone[2][idx]] }
end
#********further exploration***************
def transpose!(matrix)
  matrix.each do |row|
    matrix.size.times do |idx|
      matrix[idx] << row.shift
    end
  end
  matrix
end
#********SIMILAR***************************
def transpose!(matrix)
  matrix.each_with_index do |row, i|
    i.times do |index|
      row[index], matrix[index][i] = matrix[index][i], row[index]
    end
  end
end

# matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# new_matrix = transpose(matrix)
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
