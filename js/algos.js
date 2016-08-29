// BUSINESS LOGIC

// returns the longest string in an array
function longestWord(wordArray){
	longestWord = wordArray[0];
	for (var i = 0; i < wordArray.length; i++) {
		if (wordArray[i].length > longestWord.length){
			longestWord = wordArray[i];
		}
	}
	return longestWord;
}

// returns true is two objects contain matching key, value. returns false otherwise
function objectsKeyValueEqual(obj1, obj2){
	for (key in obj1){
		for (key in obj2){
			if (obj1[key] == obj2[key]){
				return true;
			}
		}
	}
	return false;
}

// generates a random number between min and max
function randomInRange(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// generates a random string of length stringLength
function stringGenerator(stringLength){
	var alpha = "abcdefghijklmnopqrstuvwxyz"
	string = ""
	for (var i = 0; i <= stringLength; i++){
		string = string.concat(alpha[randomInRange(0, alpha.length)])
	}
	return string
}

// genereate an array of length arrayLength containing random strings
function randStrArray(arrayLength){
	var randomArray = [];
	for (var i = 1; i <= arrayLength; i++){
		randomArray.push(stringGenerator(randomInRange(1,10)));
	}
	return randomArray;
}

// DRIVER CODE

console.log(longestWord(["a word","something else","the longest phrase"]));

console.log(objectsKeyValueEqual({name: "Bob", age: 52},{name: "Joe", age: 54}));
console.log(objectsKeyValueEqual({name: "Bob", age: 52},{name: "Bob", age: 54}));
console.log(objectsKeyValueEqual({name: "Bob", age: 52},{name: "Joe", age: 52}));

console.log(randStrArray(5))
console.log(randStrArray(10))


