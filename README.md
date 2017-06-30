# DynamicCollpsableCellExample
Example project showing iOS dynamically sized and collapsable TableView Cells

iOS demo of DynamicCollapsableCellExample

## Installation

Clone or download this repository and run. Developed and tested in Xcode 8.2.1 and iOS 10.2.

## Description

The goals were to create a dynamically sizing TableViewCell that could also be expanded and collapsed on demand.

This demo grew out of several questions on stackoverflow, and then just became a puzzle I wanted to solve. I don't even remember all the  different ways I attempted to achieve goals before getting this method working.

Two key functionalities are utilized to make this work: custom TableViewCells and AutoLayout. Custom TableViewCells is fairly well known and straight forward. Autolayout can be a bit more difficult.

### AutoLayout

There's no getting around the fact that Autolayout can be a bit finaky to work with, espeically given Interface Builder's quirks added on top. But getting this functionality to work requires Autolayout, so make sure you are familiar with using it and reviewing the settings in this project to understand everthing.


## Implementation Details

### Adding Buttons to Static Headers

The biggest challenges was working around the fact that static header cells can be reused by the TableView. So if one is modified, for example by adding a button, then when it is reused a second button could be added. This is only a problem if the TableView is large enough to scrolll off screen, but should be guarded against as the results can be tough to track down.

If multiple buttons are added to a header, some mechanism to identify each button is needed. The UIButton.tag is one option, but in the demo that field is used to identify which section to act on. Instead, the UIButton.currentTitle is used to differentiate between them. Another option would be to use the tag string to include two pieces of information.

### Show/Hide Rows

This functionality is currently based on clearing/adding data from fields to get the cells to shrink/grow. I attempted to use the isHidden functionality as well as adding a subView, but neither seemed to work. The subView approach specifically was disappointing, as it seemed the logical choice for resuability and efficiency.

### StackView Demo

Inlcuded in the project is a Stackview example (not in a TableViewCell) that also demos dynamic sizing elements. 

## Limitations & Next Steps

There are a few little things that could/should be cleaned up:

1. The sublabel in the exanding section of the TableViewCell is currently displaying centered vertically. It should be possible to make the subtitle and details label part of a horizontal StackView which could then be aligned to the top to solve this.

2. The animation on the Stackview Demo will show text outside their views during the animation. Ideally the text would be replaced at the end of the animation after the box is guarenteed to be the correct size. Maybe someone else knowns how to do this.

## Credits

This demo was possible due to several resoures that I have utilized in the past. Below is an incomplete list:

- [Auto Layout Tutorial in iOS 9 Part 1: Getting Started](https://www.raywenderlich.com/115440/auto-layout-tutorial-in-ios-9-part-1-getting-started-2)
- [UIStackView Tutorial: Introducing Stack Views](https://www.raywenderlich.com/114552/uistackview-tutorial-introducing-stack-views)

## License

Free to use/modify
