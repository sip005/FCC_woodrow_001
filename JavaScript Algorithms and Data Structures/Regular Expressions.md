# Regular Expressions

- 01. [Using the Test Method](#using-the-test-method)
- 02. [Match Literal Strings](#match-literal-strings)
- 03. [Match a Literal String with Different Possibilities](#match-a-literal-string-with-different-possibilities)
- 04. [Ignore Case While Matching](#ignore-case-while-matching)
- 05. [Extract Matches](#extract-matches)
- 06. [Find More Than the First Match](#find-more-than-the-first-match)
- 07. [Match Anything with Wildcard Period](#match-anything-with-wildcard-period)
- 08. [Match Single Character with Multiple Possibilities](#match-single-character-with-multiple-possibilities)
- 09. [Match Letters of the Alphabet](#match-letters-of-the-alphabet)
- 10. [Match Numbers and Letters of the Alphabet](#match-numbers-and-letters-of-the-alphabet)
- 11. [Match Single Characters Not Specified](#match-single-characters-not-specified)
- 12. [Match Characters that Occur One or More Times](#match-characters-that-occur-one-or-more-times)
- 13. [Match Characters that Occur Zero or More Times](#match-characters-that-occur-zero-or-more-times)
- 14. [Find Characters with Lazy Matching](#find-characters-with-lazy-matching)
- 15. [Find One or More Criminals in a Hunt](#find-one-or-more-criminals-in-a-hunt)
- 16. [Match Beginning String Patterns](#match-beginning-string-patterns)
- 17. [Match Ending String Patterns](#match-ending-string-patterns)
- 18. [Match All Letters and Numbers](#match-all-letters-and-numbers)
- 19. [Match Everything But Letters and Numbers](#match-everything-but-letters-and-numbers)
- 20. [Match All Numbers](#match-all-numbers)
- 21. [Match All Non-Numbers](#match-all-non-numbers)
- 22. [Restrict Possible Usernames](#restrict-possible-usernames)
- 23. [Match Whitespace](#match-whitespace)
- 24. [Match Non-Whitespace Characters](#match-non-whitespace-characters)
- 25. [Specify Upper and Lower Number of Matches](#specify-upper-and-lower-number-of-matches)
- 26. [Specify Only the Lower Number of Matches](#specify-only-the-lower-number-of-matches)
- 27. [Specify Exact Number of Matches](#specify-exact-number-of-matches)
- 28. [Check for All or None](#check-for-all-or-none)
- 29. [Positive and Negative Lookahead](#positive-and-negative-lookahead)
- 30. [Check For Mixed Grouping of Characters](#check-for-mixed-grouping-of-characters)
- 31. [Reuse Patterns Using Capture Groups](#reuse-patterns-using-capture-groups)
- 32. [Use Capture Groups to Search and Replace](#use-capture-groups-to-search-and-replace)
- 33. [Remove Whitespace from Start and End](#remove-whitespace-from-start-and-end)


### Using the Test Method 

**01- Using the Test Method**  

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

### Match a Literal String with Different Possibilities

### Ignore Case While Matching

### Extract Matches

### Find More Than the First Match

### Match Anything with Wildcard Period

### Match Single Character with Multiple Possibilities

### Match Letters of the Alphabet

### Match Numbers and Letters of the Alphabet

### Match Single Characters Not Specified

### Match Characters that Occur One or More Times

### Match Characters that Occur Zero or More Times

### Find Characters with Lazy Matching

### Find One or More Criminals in a Hunt

### Match Beginning String Patterns

### Match Ending String Patterns

### Match All Letters and Numbers

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