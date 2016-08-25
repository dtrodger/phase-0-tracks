// method to reverse a string
// string as input
//use split method to divie string letters into an array
// user reverse method to reverse to order of the elements in the array
// user join to join the elements in the array

function reverse_string(string) {
  return string.split('').reverse().join('');
}

var reverse_alphabet = reverse_string("abcdefghijklmnopqrstuvwzyx")
console.log(reverse_alphabet)
