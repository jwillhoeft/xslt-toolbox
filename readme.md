# XSLT Toolbox

## identity.xslt - The identity template
A template which copies the input recursively to the output. As a newcomer to XSLT you might wonder what this is good for, as it obviously does nothing and even that in a rather obscure way.

Well basically you're right. Even if you needed to just copy your xml input, you could simply use <xsl:copy-of /> to do that. No recursion and easy to read, too. The fun behind the identity template is that it is so easy to extend.

### When to use
You use it when in general you want to keep the input structure, but you want to make changes to certain elements or sub-trees. To define those changes you just add additional <xsl:template /> to the identity template. Their match-attribute will have precedence over the identity template's because it is (hopefully) more specific. This leads to a concise, declarative and generic approach to transformations of complex xml.

### When *not* to use
Do not use the identity template approach when your target xml is structurally different to your input, so there is no sense in copying the input in general. For example your output is a summary of your input or has a different hierarchy. 

### identity_usage.xslt - How to work with the identity template
An example usage for the identity template approach. Use "identity_usage_input.xml" as example input. you can see, it is straight-forward and easy understandable to make changes like:
* removing elements
* renaming elements, but keeping their children
* adding attributes to existing elements
* adding new elements
