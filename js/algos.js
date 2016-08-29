function longestWord(wordArray){
	longestWord = wordArray[0];
	for (var i = 0; i < wordArray.length; i++) {
		if (wordArray[i].length > longestWord.length){
			longestWord = wordArray[i];
		}
	}
	return longestWord;
}


console.log(longestWord(["a word","something else","the longest phrase"]));

