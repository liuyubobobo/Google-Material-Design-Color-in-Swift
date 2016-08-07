## Google Material Design Color

This repo is an implementation for **Google Material Design Colors** by **Swift 2.2**. Visit [https://material.google.com/style/color.html](https://material.google.com/style/color.html) to see the details.

### Demo

The demo is a simple iOS UITableView app to show different GMD Colors.

![GMD Color Type](https://github.com/liuyubobobo/Google-Material-Design-Color/blob/master/ScreenShot/ScreenShot1.png?raw=true)

![GMD Color Detail](https://github.com/liuyubobobo/Google-Material-Design-Color/blob/master/ScreenShot/ScreenShot2.png?raw=true)

### Usage

- Copy the ``GMDColor.swift`` int your project. (**GMD** is short for **Google Material Design**)

- To get a GMD primary color, call ``GMD.primaryColor(colorType:)`` or ``GMD.primaryColor(colorType:level:)``, it will return an UIColor type represents the GMD primary color.

```swift
// Example 1: get the red GMD primary color
let red = GMD.primaryColor(.Red)

// Example 2: get the blue GMD primary color, with level 700
let blue = GMD.primaryColor(.Blue, level: .P700)
``` 

- To get a GMD accent color, call ``GMD.accentColor(colorType:level:)``, it will return an **optional** UIColor type represents the GMD accent color. (Since not all the color has accent color, the return value is optional.)

```swift
// Example: get the purple GMD accent color, with level A100
let purple: UIColor? = GMD.accentColor(.Purple, level: .A100)
``` 

- To get a text color when the texts are shown on the primary GMD color or accent GMD color, call ``GMD.textColor(colorType:level)``

```swift
// Example 1: get the text color on default deep orange GMD primary color
let textColorOnDeepOrange = GMD.textColor(.DeepOrange)

// Example 2: get the text color on cyan GMD primary color, with level P700
let textColorOnCyan = GMD.textColor(.Cyan, level: .P700)

// Example 3: get the text color on lime GMD accent color, with level A400
let textColorOnLime = GMD.textColor(.Cyan, level: .A400)
``` 

- You can overwrite your own dark text color and light text color in **GMD** class like this:

```swift
// Overwrite your own dark text color and light text color

GMD.darkTextColor = UIColor.blackColor()
GMD.lightTextColor = UIColor.yellowColor()
```