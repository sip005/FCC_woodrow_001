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

### Match All Numbers

### Match All Non-Numbers

### Restrict Possible Usernames

### Match Whitespace

### Match Non-Whitespace Characters

### Specify Upper and Lower Number of Matches

### Specify Only the Lower Number of Matches

### Specify Exact Number of Matches

### Check for All or None

### Positive and Negative Lookahead

### Check For Mixed Grouping of Characters

### Reuse Patterns Using Capture Groups

### Use Capture Groups to Search and Replace

### Remove Whitespace from Start and End