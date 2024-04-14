# Learn HTML by Building a Cat Photo App  

## Step 42  

Use the button `element` to create a `clickable button`. For example, `<button>Click Here</button>` creates a `button` with the text `Click Here`.

Add a `button` element with the text Submit below the input element. The default behavior of clicking a form button without any attributes submits the `form` to the location specified in the form's action attribute.  

```html
          <input type="text" name="catphotourl" placeholder="cat photo URL" required>
          <button>Submit</button>
```  

## Step 43  

Even though you added your `button` below the text input, they appear next to each other on the page. That's because both input and button elements are inline elements, which don't appear on new lines.

The button you added will submit the form by default. However, relying on default behavior may cause confusion. Add the `type` attribute with the value `submit` to the button to make it clear that it is a submit button.  

```html
          <button type="submit">Submit</button>
```  

## Step 44  

You can use radio buttons for questions where you want only one answer out of multiple options.

Here is an example of a radio button with the option of cat: `<input type="radio"> cat`. Remember that input elements are self-closing.

Before the text input, add a radio button with the option set as:

`Indoor`  

```html
          <input type="radio"> Indoor
          <input type="text" name="catphotourl" placeholder="cat photo URL" required>
```  

## Step 45  

`label` elements are used to help associate the text for an `input` element with the input element itself (especially for assistive technologies like screen readers). For example, `<label><input type="radio"> cat</label>` makes it so clicking the word cat also selects the corresponding radio button.

Nest your `radio` button inside a `label` element.

```html
          <label> <input type="radio"> Indoor </label>
```  

## Step 46  

The `id` attribute is used to identify specific `HTML elements`. Each `id` attribute's value must be unique from all other `id` values for the entire page.

Add an `id` attribute with the value `indoor` to the radio button. When elements have multiple attributes, the order of the attributes doesn't matter.  

```html
          <label><input id="indoor" type="radio"> Indoor</label>
```  

## Step 47  
Create another radio button below the first one. Nest it inside a `label` element with `Outdoor` as the `label text`. Give the radio button an `id` attribute with `outdoor` as the value.  

```html
          <label><input id="indoor" type="radio"> Indoor</label>

          <label><input id="outdoor" type="radio"> Outdoor</label>  
```  

## Step 48  

Notice that both radio buttons can be selected at the same time. To make it so selecting one radio button automatically deselects the other, both buttons must have a `name` attribute with the same value.

Add the `name` attribute with the value `indoor-outdoor` to both radio buttons.  

```html
          <label><input id="indoor" name="indoor-outdoor" type="radio"> Indoor</label>
          <label><input id="outdoor" name="indoor-outdoor" type="radio"> Outdoor</label>
```  

## Step 49  

If you select the `Indoor` radio button and submit the form, the form data for the button is based on its name and value attributes. Since your radio buttons do not have a value attribute, the form data will include `indoor-outdoor=on`, which is not useful when you have multiple buttons.

Add a value attribute to both radio buttons. For convenience, set the button's value attribute to the same value as its `id` attribute.  

```html
          <label><input value="indoor" id="indoor" type="radio" name="indoor-outdoor"> Indoor</label>
          <label><input value="outdoor" id="outdoor" type="radio" name="indoor-outdoor"> Outdoor</label>
```  

## Step 50  

The fieldset element is used to group related inputs and labels together in a web form. fieldset elements are block-level elements, meaning that they appear on a new line.

Nest the Indoor and Outdoor radio buttons within a fieldset element, and don't forget to indent the radio buttons.  

```html
        <fieldset>
          <label><input id="indoor" type="radio" name="indoor-outdoor" value="indoor"> Indoor</label>
        </fieldset>
        <fieldset>
          <label><input id="outdoor" type="radio" name="indoor-outdoor" value="outdoor"> Outdoor</label>
        </fieldset>
```  

## Step 51  

The legend element acts as a caption for the content in the fieldset element. It gives users context about what they should enter into that part of the form.

Add a legend element with the text Is your cat an indoor or outdoor cat? above both of the radio buttons.  

```html
          <fieldset>
            <legend>Is your cat an indoor or outdoor cat?</legend>
            
            <label><input id="indoor" type="radio" name="indoor-outdoor" value="indoor"> Indoor</label>
            <label><input id="outdoor" type="radio" name="indoor-outdoor" value="outdoor"> Outdoor</label>
          </fieldset>
```  

## Step 52  

Next, you are going to add some new form input elements, so add another fieldset element directly below the current fieldset element.  

```html
          <fieldset>
            <legend>Is your cat an indoor or outdoor cat?</legend>
            <label><input id="indoor" type="radio" name="indoor-outdoor" value="indoor"> Indoor</label>
            <label><input id="outdoor" type="radio" name="indoor-outdoor" value="outdoor"> Outdoor</label>
          </fieldset>
          <fieldset>
            
          </fieldset>
```  

## Step 53  

Add a legend element with the text What's your cat's personality? inside the second fieldset element.

```html
          <fieldset>
            <legend>What's your cat's personality</legend>      
          </fieldset>
```  

## Step 54  

Forms commonly use checkboxes for questions that may have more than one answer. For example, here's a checkbox with the option of tacos: `<input type="checkbox">` tacos.

Under the legend element you just added, add an input with its type attribute set to checkbox and give it the option of:

`Loving`  

```html
            <legend>What's your cat's personality?</legend>
            <input type="checkbox"> loving
            
```  

## Step 55  

Add an id attribute with the value loving to the checkbox input.

```html
           <input id="loving" type="checkbox"> Loving
```  

## Step 56
There's another way to associate an input element's text with the element itself. You can nest the text within a label element and add a for attribute with the same value as the input element's id attribute.

Associate the text Loving with the checkbox by nesting only the text Loving in a label element and giving it an appropriate for attribute.