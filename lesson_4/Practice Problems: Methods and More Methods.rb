#Practice Problem 1
#What is the return value of the select method below? Why?
[1,2,3].select do |num|
  num > 5
  "hi"
end
#select performs selection based on the "truthiness" of the blocks return value.
#In this case the return value is "hi", which is a "truthy" value.
#So select will return a NEW array containing all of the elements of the orig array.

#Practice Problem 2
#How does count treat the block's return value?
#How can we find out?
a = ["ant", "bat", "caterpillar"]. count do |str|
  str.length < 4
end
# Count also counts the elements based on the "truthiness" of the blocks return value.
# And only counds those elements for which the block's return value evaluates to true.

#Practice Problem 3
#What is the return value of reject in the following code? Why?
[1,2,3].reject do |num|
  puts num
end

#reject returns a new array containing items where the block's return value
#is "falsey". In other words, if the return value was false or nil the element
#would be selected.

#Practice Problem 4
#What is the return value of each_with_object in the following code? Why?
a = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# When we invoke each_with_object, we pass in an object as an argument. That
# object is then passed into the block and is returned at the end of each
# iteration. Once each_with_object has iterated over the calling collection, it
# returns the initially given object. In this case that object was modified within
# the block and now contains three key-value pairs.
