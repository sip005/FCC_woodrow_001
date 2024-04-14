# Regular Expressions

 01. [Using the Test Method](#using-the-test-method)
 02. [Match Literal Strings](#match-literal-strings)
 03. [Match a Literal String with Different Possibilities](#match-a-literal-string-with-different-possibilities)
 04. [Ignore Case While Matching](#ignore-case-while-matching)
 05. [Extract Matches](#extract-matches)
 06. [Find More Than the First Match](#find-more-than-the-first-match)
 07. [Match Anything with Wildcard Period](#match-anything-with-wildcard-period)
 08. [Match Single Character with Multiple Possibilities](#match-single-character-with-multiple-possibilities)
 09. [Match Letters of the Alphabet](#match-letters-of-the-alphabet)
 10. [Match Numbers and Letters of the Alphabet](#match-numbers-and-letters-of-the-alphabet)
 11. [Match Single Characters Not Specified](#match-single-characters-not-specified)
 12. [Match Characters that Occur One or More Times](#match-characters-that-occur-one-or-more-times)
 13. [Match Characters that Occur Zero or More Times](#match-characters-that-occur-zero-or-more-times)
 14. [Find Characters with Lazy Matching](#find-characters-with-lazy-matching)
 15. [Find One or More Criminals in a Hunt](#find-one-or-more-criminals-in-a-hunt)
 16. [Match Beginning String Patterns](#match-beginning-string-patterns)
 17. [Match Ending String Patterns](#match-ending-string-patterns)
 18. [Match All Letters and Numbers](#match-all-letters-and-numbers)
 19. [Match Everything But Letters and Numbers](#match-everything-but-letters-and-numbers)
 20. [Match All Numbers](#match-all-numbers)
 21. [Match All Non-Numbers](#match-all-non-numbers)
 22. [Restrict Possible Usernames](#restrict-possible-usernames)
 23. [Match Whitespace](#match-whitespace)
 24. [Match Non-Whitespace Characters](#match-non-whitespace-characters)
 25. [Specify Upper and Lower Number of Matches](#specify-upper-and-lower-number-of-matches)
 26. [Specify Only the Lower Number of Matches](#specify-only-the-lower-number-of-matches)
 27. [Specify Exact Number of Matches](#specify-exact-number-of-matches)
 28. [Check for All or None](#check-for-all-or-none)
 29. [Positive and Negative Lookahead](#positive-and-negative-lookahead)
 30. [Check For Mixed Grouping of Characters](#check-for-mixed-grouping-of-characters)
 31. [Reuse Patterns Using Capture Groups](#reuse-patterns-using-capture-groups)
 32. [Use Capture Groups to Search and Replace](#use-capture-groups-to-search-and-replace)
 33. [Remove Whitespace from Start and End](#remove-whitespace-from-start-and-end)


### Using the Test Method 

**01 - Using the Test Method**  

Regular expressions are used in programming languages to match parts of strings. We create patterns to help us to that matching.

If we want to find the word the in the string The dog chased the cat, we could use the following regular expression: `/the/`. Notice that quote marks are not required within the regular expression.

JavaScript has multiple ways to use regexes. One way to test a regex is using the `.test() method`. The .test() method takes the regex, applies it to a string (which is placed inside the parentheses), and returns true or false if your pattern finds something or not.
Example:  

```javascript
let testStr = "freeCodeCamp";
let testRegex = /Code/;
testRegex.test(testStr);
```  

Apply the regex myRegex on the string myString using the .test() method.  

Solution:  

```js
let myString = "Hello, World!";
let myRegex = /Hello/;
let result = myRegex.test(myString); // Change this line
```  

### Match Literal Strings

**02 - Match Literal Strings**  



### Match a Literal String with Different Possibilities

### Ignore Case While Matching

### Extract Matches

### Find More Than the First Match

### Match Anything with Wildcard Period

### Match Single Character with Multiple Possibilities

### Match Letters of the Alphabet

### Match Numbers and Letters of the Alphabet

**10 - Match Numbers and Letters of the Alphabet**

Using the hyphen `(-)` to match a range of characters is not limited to letters. It also works to match a range of numbers.

For example, `/[0-5]/` matches any number between `0` and `5`, including the `0` and `5`.

Also, it is possible to combine a range of letters and numbers in a single character set.

```js
let jennyStr = "Jenny8675309";
let myRegex = /[a-z0-9]/ig;
jennyStr.match(myRegex);
```

Create a single regex that matches a range of letters between `h` and `s`, and a range of numbers between `2` and `6`. Remember to include the appropriate flags in the regex.  

Solution:  

```js
let quoteSample = "Blueberry 3.141592653s are delicious.";
let myRegex = /[h-s2-6]/ig;
let result = quoteSample.match(myRegex); // Change this line
```

### Match Single Characters Not Specified

**11 - Match Single Characters Not Specified**

So far, you have created a set of characters that you want to match, but you could also create a set of characters that you do not want to match. These types of character sets are called negated character sets.

To create a negated character set, you place a caret character `(^)` after the opening bracket and before the characters you do not want to match.

For example, `/[^aeiou]/gi` matches all characters that are not a vowel. Note that characters like `., !, [, @, / and white space are matched` - the `negated vowel` character set only excludes the vowel characters.

Create a single regex that matches all characters that are not a number or a vowel. Remember to include the appropriate flags in the regex.  

Solution:  

```js
let quoteSample = "3 blind mice.";
let myRegex = /[^aeiou^0-9]/gi; // Change this line
let result = quoteSample.match(myRegex); // Change this line
console.log(result)
```



### Match Characters that Occur One or More Times

**12 - Match Characters that Occur One or More Times**

Sometimes, you need to match a character (or group of characters) that appears one or more times in a row. This means it occurs at least once, and may be repeated.

You can use the `+` character to check if that is the case. Remember, the character or pattern has to be present consecutively. That is, the character has to repeat one after the other.

For example, `/a+/g` would find one match in abc and return `["a"]`. Because of the `+`, it would also find a single match in aabc and return `["aa"]`.

If it were instead checking the string `abab`, it would find two matches and return ["a", "a"] because the a characters are not in a row - there is a `b` between them. Finally, since there is no a in the string bcd, it wouldn't find a match.

You want to find matches when the letter s occurs one or more times in `Mississippi`. Write a regex that uses the `+` sign.  

Solution  

```js
let difficultSpelling = "Mississippi";
let myRegex = /s+/g; // Change this line
let result = difficultSpelling.match(myRegex);
```

### Match Characters that Occur Zero or More Times  

**13 - Match Characters that Occur Zero or More Times**

The last challenge used the plus `+` sign to look for characters that occur one or more times. There's also an option that matches characters that occur zero or more times.

The character to do this is the asterisk or star: `*`.

```js
let soccerWord = "gooooooooal!";
let gPhrase = "gut feeling";
let oPhrase = "over the moon";
let goRegex = /go*/;
const a = soccerWord.match(goRegex);
const b = gPhrase.match(goRegex);
const c = oPhrase.match(goRegex);
console.log("1:");
console.log(a);
console.log("2:");
console.log(b);
console.log("3:");
console.log(c);
```  

In order, the three match calls would return the values `["goooooooo"], ["g"], and null`.

For this challenge, chewieQuote has been initialized as the string `Aaaaaaaaaaaaaaaarrrgh!` behind the scenes. Create a regex `chewieRegex` that uses the `*` character to match an uppercase A character immediately followed by zero or more lowercase a characters in chewieQuote. Your regex does not need flags or character classes, and it should not match any of the other quotes.  

Solution  

```js
// Only change code below this line
let chewieRegex = /Aa*/; // Change this line
// Only change code above this line

let result = chewieQuote.match(chewieRegex);
console.log(result)
```

### Find Characters with Lazy Matching

**14 - Find Characters with Lazy Matching**

In regular expressions, a greedy match finds the longest possible part of a string that fits the regex pattern and returns it as a match. The alternative is called a lazy match, which finds the smallest possible part of the string that satisfies the regex pattern.

You can apply the regex `/t[a-z]*i/` to the string `"titanic"`. This regex is basically a pattern that starts with t, ends with i, and has some letters in between.

Regular expressions are by default greedy, so the match would return `["titani"]`. It finds the largest sub-string possible to fit the pattern.

However, you can use the `?` character to change it to lazy matching. `"titanic"` matched against the adjusted regex of `/t[a-z]*?i/` returns `["ti"]`.

Note: Parsing HTML with regular expressions should be avoided, but pattern matching an HTML string with regular expressions is completely fine.

Fix the regex `/<.*>/` to return the HTML tag `<h1>` and not the text `"<h1>Winter is coming</h1>"`. Remember the wildcard `.` in a regular expression matches any character.  

Solution:  

```js
let text = "<h1>Winter is coming</h1>";
let myRegex = /<.*?>/; // it's the answer!
let result = text.match(myRegex);
```  

```js
let text = "<h1>Winter is coming</h1>";
let myRegex = /<h[a-z]*?1>/; // Change this line
let result = text.match(myRegex);
console.log(result);
```

### Find One or More Criminals in a Hunt

**15 - Find One or More Criminals in a Hunt**

Time to pause and test your new regex writing skills. A group of criminals escaped from jail and ran away, but you don't know how many. However, you do know that they stay close together when they are around other people. You are responsible for finding all of the criminals at once.

Here's an example to review how to do this:

The regex `/z+/` matches the letter z when it appears one or more times in a row. It would find matches in all of the following strings:

```js
"z"
"zzzzzz"
"ABCzzzz"
"zzzzABC"
"abczzzzzzzzzzzzzzzzzzzzzabc"
```  

But it does not find matches in the following strings since there are no letter `z` characters:

```js
""
"ABC"
"abcabc"
```  

Write a greedy regex that finds one or more criminals within a group of other people. A criminal is represented by the capital letter `C`.  

Solution

```js
let reCriminals = /C+/; // Change this line
```  

### Match Beginning String Patterns

**16 - Match Beginning String Patterns**  

Prior challenges showed that regular expressions can be used to look for a number of matches. They are also used to search for patterns in specific positions in strings.

In an earlier challenge, you used the caret character (^) inside a character set to create a negated character set in the form [^thingsThatWillNotBeMatched]. Outside of a character set, the caret is used to search for patterns at the beginning of strings.

```js
let firstString = "Ricky is first and can be found.";
let firstRegex = /^Ricky/;
firstRegex.test(firstString);
let notFirst = "You can't find Ricky now.";
firstRegex.test(notFirst);
```

The first test call would return true, while the second would return false.  

Use the caret character in a regex to find Cal only in the beginning of the string rickyAndCal.  

```js
let rickyAndCal = "Cal and Ricky both like racing.";
let calRegex = /^Cal/; // Change this line
let result = calRegex.test(rickyAndCal);
```

### Match Ending String Patterns

**17 - Match Ending String Patterns**  

In the last challenge, you learned to use the caret character to search for patterns at the beginning of strings. There is also a way to search for patterns at the end of strings.

You can search the end of strings using the dollar sign character $ at the end of the regex.  

```js
let theEnding = "This is a never ending story";
let storyRegex = /story$/;
storyRegex.test(theEnding);
let noEnding = "Sometimes a story will have to end";
storyRegex.test(noEnding);
``` 

The first test call would return true, while the second would return false.

Use the anchor character ($) to match the string caboose at the end of the string caboose.

```js
let caboose = "The last car on a train is the caboose";
let lastRegex = /caboose$/; // Change this line
let result = lastRegex.test(caboose);
```

### Match All Letters and Numbers

**18 - Match All Letters and Numbers**  

Using character classes, you were able to search for all letters of the alphabet with `[a-z]`. This kind of character class is common enough that there is a shortcut for it, although it includes a few extra characters as well.

The closest character class in JavaScript to match the alphabet is `\w`. This shortcut is equal to `[A-Za-z0-9_]`. This character class matches upper and lowercase letters plus numbers. Note, this character class also includes the underscore character `(_)`. 

```js
let longHand = /[A-Za-z0-9_]+/;
let shortHand = /\w+/;
let numbers = "42";
let varNames = "important_var";
longHand.test(numbers);
shortHand.test(numbers);
longHand.test(varNames);
shortHand.test(varNames);
```

All four of these test calls would return true.

These shortcut character classes are also known as shorthand character classes.

Use the shorthand character class \w to count the number of alphanumeric characters in various quotes and strings.

```js
let quoteSample = "The five boxing wizards jump quickly.";
let alphabetRegexV2 = /\w/g; // Change this line
let result = quoteSample.match(alphabetRegexV2).length;
```  


### Match Everything But Letters and Numbers  

**19 - Match Everything But Letters and Numbers**  

We've learned that you can use a shortcut to match alphanumerics `[A-Za-z0-9_]` using `\w`. A natural pattern you might want to search for is the opposite of alphanumerics.

You can search for the opposite of the \w with \W. Note, the opposite pattern uses a capital letter. This shortcut is the same as `[^A-Za-z0-9_]`.  

```js
let shortHand = /\W/;
let numbers = "42%";
let sentence = "Coding!";
numbers.match(shortHand);
sentence.match(shortHand);
```  

The first match call would return the value `["%"]` and the second would return `["!"]`.

Use the shorthand character class `\W` to count the number of non-alphanumeric characters in various quotes and strings.  

```js 
let quoteSample = "The five boxing wizards jump quickly.";
let nonAlphabetRegex = /\W/g; // Change this line
let result = quoteSample.match(nonAlphabetRegex).length;
```  

### Match All Numbers  

**20 - Match All Numbers**  

You've learned shortcuts for common string patterns like alphanumerics. Another common pattern is looking for just digits or numbers.

The shortcut to look for digit characters is \d, with a lowercase d. This is equal to the character class [0-9], which looks for a single character of any number between zero and nine.

Use the shorthand character class \d to count how many digits are in movie titles. Written out numbers ("six" instead of 6) do not count.  

```js
let movieName = "2001: A Space Odyssey";
let numRegex = /\d/g; // Change this line
let result = movieName.match(numRegex).length;
```  

### Match All Non-Numbers  

**21 - Match All Non-Numbers**  

The last challenge showed how to search for digits using the shortcut \d with a lowercase d. You can also search for non-digits using a similar shortcut that uses an uppercase D instead.

The shortcut to look for non-digit characters is \D. This is equal to the character class [^0-9], which looks for a single character that is not a number between zero and nine.

Use the shorthand character class for non-digits \D to count how many non-digits are in movie titles.  

```js
let movieName = "2001: A Space Odyssey";
let noNumRegex = /\D/g; // Change this line
let result = movieName.match(noNumRegex).length;
```  

### Restrict Possible Usernames  

**22 - Restrict Possible Usernames**  

Usernames are used everywhere on the internet. They are what give users a unique identity on their favorite sites.

You need to check all the usernames in a database. Here are some simple rules that users have to follow when creating their username.  

1. Usernames can only use alphanumeric characters.  

2. The only numbers in the username have to be at the end. There can be zero or more of them at the end. Username cannot start with the number.

3. Username letters can be lowercase and uppercase.  

4. Usernames have to be at least two characters long. A two-character username can only use alphabet letters as characters.  

5. Change the regex userCheck to fit the constraints listed above.  

```js
let username = "JackOfAllTrades";
let userCheck = /^[a-z][a-z]+\d*$|^[a-z]\d\d+$/i;
let result = userCheck.test(username);
console.log(result)

/*
Code Explanation
  - ^ - start of input
  - [a-z] - first character is a letter
  - [a-z]+ - following characters are letters
  - \d*$ - input ends with 0 or more digits
  - | - or
  - ^[a-z] - first character is a letter
  - \d\d+ - following characters are 2 or more digits
  - $ - end of input
*/
```  

**OR**  

```js
let username = "JackOfAllTrades";
const userCheck = /^[a-z]([0-9]{2,}|[a-z]+\d*)$/i;
let result = userCheck.test(username);

/*
Code Explanation
  - ^ - start of input
  - [a-z] - first character is a letter
  - [0-9]{2,} - ends with two or more numbers
  - | - or
  - [a-z]+ - has one or more letters next
  - \d* - and ends with zero or more numbers
  - $ - end of input
  - i - ignore case of input
*/
```  

### Match Whitespace  

**23 - Match Whitespace**  

The challenges so far have covered matching letters of the alphabet and numbers. You can also match the whitespace or spaces between letters.

You can search for whitespace using `\s`, which is a lowercase `s`. This pattern not only matches whitespace, but also carriage return, tab, form feed, and new line characters. You can think of it as similar to the character class `[ \r\t\f\n\v]`.

```js
let whiteSpace = "Whitespace. Whitespace everywhere!"
let spaceRegex = /\s/g;
whiteSpace.match(spaceRegex);
// This match call would return [" ", " "].
```  

Change the regex countWhiteSpace to look for multiple whitespace characters in a string.  

```js
let sample = "Whitespace is important in separating words";
let countWhiteSpace = /\s/g; // Change this line
let result = sample.match(countWhiteSpace);
console.log(result);
```  

### Match Non-Whitespace Characters  

**24 - Match Non-Whitespace Characters**  

You learned about searching for whitespace using \s, with a lowercase s. You can also search for everything except whitespace.

Search for non-whitespace using \S, which is an uppercase s. This pattern will not match whitespace, carriage return, tab, form feed, and new line characters. You can think of it being similar to the character class [^ \r\t\f\n\v].

```js
let whiteSpace = "Whitespace. Whitespace everywhere!"
let nonSpaceRegex = /\S/g;
whiteSpace.match(nonSpaceRegex).length;
// The value returned by the .length method would be 32.
```

Change the regex countNonWhiteSpace to look for multiple non-whitespace characters in a string.

```js
let sample = "Whitespace is important in separating words";
let countNonWhiteSpace = /\S/g; // Change this line
let result = sample.match(countNonWhiteSpace);
console.log(result);
```  

### Specify Upper and Lower Number of Matches  

**25 - Specify Upper and Lower Number of Matches**  

Recall that you use the plus sign `+` to look for one or more characters and the asterisk `*` to look for zero or more characters. These are convenient but sometimes you want to match a certain range of patterns.

You can specify the lower and upper number of patterns with quantity specifiers. Quantity specifiers are used with curly brackets `({ and })`. You put two numbers between the curly brackets - for the lower and upper number of patterns.

For example, to match only the letter a appearing between `3` and `5` times in the string `ah`, your regex would be `/a{3,5}h/`.

```js
let A4 = "aaaah";
let A2 = "aah";
let multipleA = /a{3,5}h/;
multipleA.test(A4);
multipleA.test(A2);
```  

The first test call would return true, while the second would return false.

Change the regex ohRegex to match the entire phrase Oh no only when it has 3 to 6 letter h's.  

```js
let ohStr = "Ohhh no";
let ohRegex = /Oh{3,6}\sno/; // Change this line
let result = ohRegex.test(ohStr);
```  

### Specify Only the Lower Number of Matches  

**26 -Specify Only the Lower Number of Matches**  

You can specify the lower and upper number of patterns with quantity specifiers using curly brackets. Sometimes you only want to specify the lower number of patterns with no upper limit.

To only specify the lower number of patterns, keep the first number followed by a comma.

For example, to match only the string hah with the letter a appearing at least 3 times, your regex would be `/ha{3,}h/`.

```js
let A4 = "haaaah";
let A2 = "haah";
let A100 = "h" + "a".repeat(100) + "h";
let multipleA = /ha{3,}h/;
multipleA.test(A4);
multipleA.test(A2);
multipleA.test(A100);
```  

In order, the three test calls would return true, false, and true.

Change the regex haRegex to match the word Hazzah only when it has four or more letter z's.  

```js
let haStr = "Hazzzzah";
let haRegex = /Haz{4,}ah/gi; // Change this line
let result = haRegex.test(haStr);
```

### Specify Exact Number of Matches  

**27 -Specify Exact Number of Matches**  

You can specify the lower and upper number of patterns with quantity specifiers using curly brackets. Sometimes you only want a specific number of matches.

To specify a certain number of patterns, just have that one number between the curly brackets.

For example, to match only the word hah with the letter a 3 times, your regex would be /ha{3}h/.

```js
let A4 = "haaaah";
let A3 = "haaah";
let A100 = "h" + "a".repeat(100) + "h";
let multipleHA = /ha{3}h/;
multipleHA.test(A4);
multipleHA.test(A3);
multipleHA.test(A100);
```  

In order, the three test calls would return false, true, and false.

Change the regex timRegex to match the word Timber only when it has four letter m's.

```js
let timStr = "Timmmmber";
let timRegex = /Tim{4}ber/; // Change this line
let result = timRegex.test(timStr);
```

### Check for All or None  

**28 - Check for All or None**  

Sometimes the patterns you want to search for may have parts of it that may or may not exist. However, it may be important to check for them nonetheless.

You can specify the possible existence of an element with a question mark, `?`. This checks for zero or one of the preceding element. You can think of this symbol as saying the previous element is optional.

For example, there are slight differences in American and British English and you can use the question mark to match both spellings.  

```js
let american = "color";
let british = "colour";
let rainbowRegex= /colou?r/;
rainbowRegex.test(american);
rainbowRegex.test(british);
```  

Both uses of the test method would return true.

Change the regex favRegex to match both the American English (favorite) and the British English (favourite) version of the word.  

```js
let favWord = "favorite";
let favRegex = /favou?rite/; // Change this line
let result = favRegex.test(favWord);
```

### Positive and Negative Lookahead  

**29 - Positive and Negative Lookahead**  

Lookaheads are patterns that tell JavaScript to look-ahead in your string to check for patterns further along. This can be useful when you want to search for multiple patterns over the same string.

There are two kinds of lookaheads: positive lookahead and negative lookahead.

A positive lookahead will look to make sure the element in the search pattern is there, but won't actually match it. A positive lookahead is used as `(?=...)` where the `...` is the required part that is not matched.

On the other hand, a negative lookahead will look to make sure the element in the search pattern is not there. A negative lookahead is used as `(?!...)` where the `...` is the pattern that you do not want to be there. The rest of the pattern is returned if the negative lookahead part is not present.

Lookaheads are a bit confusing but some examples will help.  

```js
let quit = "qu";
let noquit = "qt";
let quRegex= /q(?=u)/;
let qRegex = /q(?!u)/;
quit.match(quRegex);
noquit.match(qRegex);
```  

Both of these match calls would return ["q"].

A more practical use of lookaheads is to check two or more patterns in one string. Here is a (naively) simple password checker that looks for between 3 and 6 characters and at least one number:

```js
let password = "abc123";
let checkPass = /(?=\w{3,6})(?=\D*\d)/;
checkPass.test(password);
```  

Use lookaheads in the pwRegex to match passwords that are greater than 5 characters long, and have two consecutive digits.  

```js
let sampleWord = "astronaut";
let pwRegex = /(?=\w{6,})(?=.*\d{2})/
; // Change this line
let result = pwRegex.test(sampleWord);
```

### Check For Mixed Grouping of Characters  

**30 - Check For Mixed Grouping of Characters**  

Sometimes we want to check for groups of characters using a Regular Expression and to achieve that we use parentheses `()`.

If you want to find either Penguin or Pumpkin in a string, you can use the following Regular Expression: `/P(engu|umpk)in/g`

Then check whether the desired string groups are in the test string by using the test() method.
```js
let testStr = "Pumpkin";
let testRegex = /P(engu|umpk)in/;
testRegex.test(testStr);
```

The test method here would return true.

Fix the regex so that it checks for the names of Franklin Roosevelt or Eleanor Roosevelt in a case sensitive manner and it should make concessions for middle names.

Then fix the code so that the regex that you have created is checked against myString and either true or false is returned depending on whether the regex matches.

```js
let myString = "Eleanor Roosevelt";
let myRegex = /(Franklin|Eleanor) (([A-Z]\.?|[A-Z][a-z]+) )?Roosevelt/;
let result = myRegex.test(myString); // Change this line
// After passing the challenge experiment with myString and see how the grouping works
```

### Reuse Patterns Using Capture Groups  
**31 - Reuse Patterns Using Capture Groups**  

Say you want to match a word that occurs multiple times like below.

let repeatStr = "row row row your boat";
You could use /row row row/, but what if you don't know the specific word repeated? Capture groups can be used to find repeated substrings.

Capture groups are constructed by enclosing the regex pattern to be captured in parentheses. In this case, the goal is to capture a word consisting of alphanumeric characters so the capture group will be \w+ enclosed by parentheses: /(\w+)/.

The substring matched by the group is saved to a temporary "variable", which can be accessed within the same regex using a backslash and the number of the capture group (e.g. \1). Capture groups are automatically numbered by the position of their opening parentheses (left to right), starting at 1.

The example below matches a word that occurs thrice separated by spaces:

let repeatRegex = /(\w+) \1 \1/;
repeatRegex.test(repeatStr); // Returns true
repeatStr.match(repeatRegex); // Returns ["row row row", "row"]
Using the .match() method on a string will return an array with the matched substring, along with its captured groups.

Use capture groups in reRegex to match a string that consists of only the same number repeated exactly three times separated by single spaces.  

```js
let repeatNum = "42 42 42";
let reRegex = /^(\d+) \1 \1$/; // Change this line
let result = reRegex.test(repeatNum);
```

### Use Capture Groups to Search and Replace

### Remove Whitespace from Start and End