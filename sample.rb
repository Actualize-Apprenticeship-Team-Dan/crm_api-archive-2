#Input a string Ex: "this is text"
#Output the reverse of the string "txet si siht"

#Create a function that will accept a string
#Break that string up into a collection of each character
#make a new string by adding each character (starting from the back of the string)
#print the new string

def reverse(string)
  arr = string.split("")
  index = arr.length - 1
  new_string= ""

  arr.length.times do
    new_string += arr[index]
    p new_string
    index -= 1
  end
  new_string
end

p reverse("This is a string!")