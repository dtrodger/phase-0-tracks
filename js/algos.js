function longestWord(wordArray){
	longestWord = wordArray[0];
	for (var i = 0; i < wordArray.length; i++) {
		if (wordArray[i].length > longestWord.length){
			longestWord = wordArray[i];
		}
	}
	return longestWord;
}


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

console.log(longestWord(["a word","something else","the longest phrase"]));


console.log(objectsKeyValueEqual({name: "Bob", age: 52},{name: "Joe", age: 54}));
console.log(objectsKeyValueEqual({name: "Bob", age: 52},{name: "Bob", age: 54}));
console.log(objectsKeyValueEqual({name: "Bob", age: 52},{name: "Joe", age: 52}));

