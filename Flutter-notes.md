Flutter

Flutter
Flutter create —org xxx.domain app name
Flutter is googles UI toolkit for building beautiful natively complex applications for mobile web and desktop from a single codebase

Callbacks can be hard to read , to write more readable code, you can use the async await syntax

# Issues

Installation Issues
<https://stackoverflow.com/questions/75238629/unsupportedclassversionerror-while-flutter-doctor-android-licenses-macos>

<https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/#what-is-usrlibexecjava-home>

# General Tips

~ represents the home directory

nano - to open the nano editor
code - to open visual studio code

To use external packages add them as dependencies in pub spec.yaml file , then run pub get , but vs come will run it automatically for you

# General Flutter

Hot reload is triggered when you save changes to the source file , it is stateful , so if you had a random word generated , it will stay the same

The main function tells flutter to run the app defined in the MyApp

The MyApp class extends stateless widgets , widgets are the elements from which you build every flutter app
Every widget has a build method that is automatically called every time the widgets circumstances change so that the widget is up to date

We invoke notifyListeners() so that any object listening to the appStaet will be notified that it ahas changed

In order to manage complexity , it is important to separate different parts of your UI into different or separate widgets

To extract a piece of code , into a widget in VS Code , move your cursor to the line , then press Cmd + . And a prompt will open

Flutter uses composition over inheritance , so something like padding isn’t  part of text, its a widget too

Flutter widgets will interpolate between values so that the UI will not just jump between states

Click cmd + shift + space to see docs of  code

You can use the semantic label to override the widget to make it more accessible for screen readers

Make sure your body is a Centre widget if you want it to be centred in the screen

Stateless - they don’t contain any mutable state of their own , none of the widget can change itself

A stateful widget extends state and can therefore manage its own values

Widgets are the central class hierarchy in the Flutter Framework , widgets are an immutable part of the UI

You can use layoutBuilder to make your app responsive

We can use placeholder widgets for pages that are unimplemented

When you want a column that scrolls, use a list widget

# Introduction to widgets

The central idea is that you build your UI out of widgets.

Widgets describe how your UI should look like in a particular configuration and state when widgets state changes , the widget rebuilds its description, which the framework diffs (compares) against the previous description in order to determine the minimal changes needed in the underlying render tree to transition from one state to the next

When writing widgets you’ll commonly make them subclasses of StatelessWidget StatefulWidget depending on whether your widget manages any state ,

a widgets main job is to implement a build function which describes the widget in terms of other lower-level widgets

The runApp function takes the given Widget and makes it the root of the widget tree

The framework builds those widgets in turn until the process bottoms out in widgets that represents the underlying RenderObject , which computes and describes the Geometry of the widget

There are basic widgets like Text Row Column Stack Container  etc

Passing widgets as arguments to other widgets is a powerful technique that lets you to create generic widgets that can be used in a variety of ways

Scaffold is a layout for the Material Components  

The gestureDetector() Widget detects gestures made by the user

# Stateful Widget and State

Stateful Widget and State are separate objects , in flutter these two types of objects have different life cycles

Widgets are temporary objects used to construct a presentation of the application in its current state

State objects on the other hand are persistent between calls to build() , allowing them to remember information

In flutter, change notifications flow “up” the widget hierarchy by the way of callbacks,
While current state flows down to the stateless widgets that do presentation
The common parent that redirects the flow is the State

If a class extends a Statefulwidget , then the widget stores mutable state

Calling setState marks this widget as dirty and schedules it to be rebuilt the next time
your app needs to update the screen.

If you forget to call setState when modifying the internal state of a widget, the framework won’t know your widget is dirty and might not call the widget’s build() function,

which means the user interface might not update to reflect the changed stateCalling setState marks this widget as dirty and schedules it to be rebuilt the next time your app needs to update the screen.

 If you forget to call setState when modifying the internal state of a widget, the framework won’t know your widget is dirty and might not call the widget’s build() function, which means the user interface might not update to reflect the changed state

Use global keys to uniquely identify child widgets

# Layouts in Flutter

Widgets are classes used to build UIs

Widgets are used for both layout and UI elements

Select a Layout widget
Create a visible widget
Add the visible widget
Add the layout widget to the page

## note

When a layout is too large to fit a device screen, a black and yellow striped pattern appears along the affected edge

Widgets can be tied to fit within a row or column using the Expanded widget

Types of widgets

Container Widget
Container Adds padding, margins, borders, background colour, or other decorations to a widget

# GridView

- Lays widgets out in a scrollable grid
- Use them to layout widgets out as a 2 dimensional list
- When a GridView detects that its contents are too long to fit the render box, it automatically scrolls.
- You can build your own Custom grid using
  - GridView.count - allows you to specify the number of columns
  - GridView.extent - allows you to specify the maximum pixel width of a tile

# ListView

    - Lays widgets out in a scrollable list

- A column like widget automatically provides scrolling wen its content is too long for its render
  - Less configurable than Column but easier to use and supports scrolling

# Stack

Overlays widgets on top of another

Many Layouts make liberal use of containers to separate  widgets using padding margin, or to add borders or margins

# Card

Card - card from the material library contains nuggets of information

# ListTile

ListTile is a specialised row widget from the Material library, for an easy way to Create a row containing up to 3 lines of text and optional leading and trailing icons

# Error

Flutter Error on line 6, column 5 of pubspec.yaml: A dependency may only have one source. sdk: flutter ^^^^
Solution
<https://stackoverflow.com/questions/49475038/flutter-error-on-line-6-column-5-of-pubspec-yaml-a-dependency-may-only-have-on>

A dependency specification must be a string or a mapping
Solution
<https://stackoverflow.com/questions/61144571/a-dependency-specification-must-be-a-string-or-a-mapping>

# Apple Dev

When taking apps to apple you must make sure it is signed with the Production profile and certificate

The appid is an identifier that apple and you uses in order to know which application that you are talking with

Errors
<https://stackoverflow.com/questions/67723331/flutter-localization-in-drawer-leads-to-null-check-operator-used-on-a-null-value>

<https://stackoverflow.com/questions/40743713/command-line-tool-error-xcrun-error-unable-to-find-utility-xcodebuild-n>

<https://www.wafrat.com/fixing-xcrun-error-unable-to-find-utility-xcodebuild-not-a-developer-tool-or-in-path/>

# Creating adaptive and responsive apps

# Responsive

- Has its layout tuned for the available screen size relaying out the UI if the user resizes the window
  - Flutter allows you to create spas that self adapt to the devices screen size and orientation
  - There are two basic approaches to creating flutter apps with responsive design
Use the LayoutBuilder class
            - From its builder property, you get a BoxConstraints Object. Examine the constraints properties to decide what to display
            - For example, if your max width is greater than your width breakpoint return a Scaffold object with a row that has a list in the left , you can also adjust your display based one devices height , the aspect ratio or some other property
            - When the constraint changes , the build function runs , in simple terms we have two layouts depending on the orientation or screen size , and we rebuild our layout depending on these
Use the MediaQuery.of()
    - Use the MediaQuery.of() method in your build function

# GENERAL TIPS FOR RESPONSIVE DESIGN

- Use MediaQuery to get the real-time size of the window.

- Use Flexible and Expanded widgets to get a flexible UI that works with percentage rather than hardcoded values.
- Use LayoutBuilder to get the ConstraintBox of the parent widget.
- You can get the orientation of the device using MediaQuery or OrientationBuilder.
- Lastly, in responsive design , don’t think about a specific device because it will get you in trouble

The unit of measurement in flutter is logical pixels

# Flexible and Expanded Widgets

Flexible and expanded are two widgets that you can use inside a Row, Column or flex , to give their children flexibility to expand the fill the available space but there is a main difference between them

# DIFFERENCE BETWEEN FLEXIBLE AND EXPANDED WIDGET

Expanded widget requires the child to fill the available space while flexible does not

# MediaQuery widget

The MediaQuery widget will give you the global size available for your application
LayoutBuilder Widget

Meanwhile you can think of LayoutBuilder as a local MediaQuery but more focus on the size constraints so it will provide you with the parent widget’s constraints to read them and decide what to display according to them
Orientation Builder

We can detect orientation changes with the Orientation builder a widget which rebuilds the layout on Orientation Change
OrientationBuilder has a builder function to build our layout . The builder function is called when the orientation changes . The possible values being Orientation.portrait or Orientation.landscape

# Building Adaptive Apps

In flutter, there are many considerations for developing platform adaptive apps but they fall into three major categories - Layout, input , idioms and norms
Building adaptive Layouts

One of the first things you must consider when bringing your app to multiple platforms is how to adapt it to various sizes and shapes on the screen that it will run on

# MOST USEFUL LAYOUT WIDGETS  

# Align

Aligns a child within itself . It takes a double value between -1 and 1 for both vertical and horizontal component

# AspectRatio

Attempts to size4 the child to a specific aspect ratio

# ConstrainedBox

Imposes size constraints on its child, offering control over the minimum or maximum size

# CustomSingleChildLayout

- Uses a delegate function to position a single child, The delegate can determine the layout constraints and positioning for the child

# Expanded or Flexible -

 Allows a child of a Row or Column to shrink or grow to fill nay available space

# FractionallySizedBox

- Sizes its child to a fraction of the available space

# LayoutBuilder -

 Builds a widget that can reflow itself based on its parents size

# SingleChildScrollView -

 Adds scrolling to a singleChild Often used with Row or Column

# MultiChild

## Column Row or Flex -

 Lays out children in a single horizontal or vertical run. Both Column and Row extend the Flex widget

## CustomMultiChildLayout -

 Uses a delegate function to position multiple children during the layout phase

## Flow -

 Similar to CustomMultiChildLayout, but more efficient because its performed during the pint phase rather than the layout phase

## ListView, GridView, CustomScrollView -

 Provides scrollable lists of children

## Stacks -

 Layers and positions multiple children relative to the edges of the Stack. Functions similarly to position-fixed in CSS

## Table -

 uses a classic table layout algorithm for its children , combining multiple rows and columns

## Wrap -

 Displays its children in multiple horizontal or vertical runs

# VISUAL DENSITY

Different input devices offer various levels of precision, which require different hit areas

Flutters VisualDensity class makes it easy to adjust the density of your views across the entire application ,
For example, making a button larger (and therefore easier to tap) on a touch device .

When you change the VisualDensity for your MaterialApp, MaterialComponents that support it animate their densities to match. By default, both horizontal and vertical densities are set to 0.0, but you can set the densities to any negative or positive value that you want. By switching between different densities, you can easily adjust your UI:
Not only does the container react automatically to changes in density, it also animates when it changes

## LayoutBuilder

Even though checking screen size is great for fullscreen pages or making global layout decisions , it’s not often ideal for nested subviews

Often, subviews have their own internal breakpoints and care only about the space that they have available to render

The simplest way to handle this in Flutter is using the LayoutBuilder class ,
LayoutBuilder allows a widget to respond to incoming local size constraints , which can make the widget more versatile than if it depended on a global value

With all views referencing the same shared-design system rules, they tend to look better and more consistent. Making a change or adjusting a value for a specific platform can be done in a single place, instead of using an error-prone search and replace

## Some common design system categories that cane represented this way are

Animation timings
Sizes and breakpoints
Insets and paddings
Corner Radius
Shadows
Strokes
Font families and styles

## Tips for adaptive app development

Use desktop build targets for rapid testing
One of the most effective ways to test adaptive interfaces is to take advantage of the desktop build targets.
When running on a desktop, you can easily resize the window while the app is running to preview various screen sizes. This, combined with hot reload, can greatly accelerate the development of a responsive UI.

## Touch first

Focus initially on a touch first Ui

## Scroll Wheel

Scrolling widgets like ScrollView or ListView support the scroll wheel by default ,if you need to implement custom roll behaviour , you use can use Listener widget, which lets you customise how you UI reacts to the scroll wheel

## Idioms and norms

The final area to consider for adaptive apps is platform standards. Each platform as its own idioms and norms ; these nominal or defect standards inform user expectations of how an application should behave

Thanks in part to the web, users are accustomed to more customised experiences but reflecting these platform standards will provide significant benefits

# Adaptive

- Adapting to run on different devices such as mobile and desktop is how to add it to the various shapes and sizes of the screen that it will work on different devices

# Understanding constraints

Flutter Layout is really different from HTML Layout, make sure you memorize the following rule:

## CONSTRAINTS GO DOWN.SIZES GO UP. PARENT SETS POSITION

 In Detail
 A widget gets its constraints from its parents,
 a constraint is a set of 4 doubles, and a minimum and maxiumu height

 The widget goes throigh its won list of children. One by one, the widget tells its children
 what their constraints areand then asks each child what size it wants to be

 Then, the widget positions its children (horizontally in the x-axis, and vertically in the y-axis) one by one

 Finally, the widget tells its parents about its own size, (within the original constraints, of coursea)

## Limitations

A widget can decide its own size only within thw constraints given to it by is parent 
This means a widget can't have any size it wants 

A widget can't know and doesnt decide its own position on the screen since its the widgets parent who decides the position of the widget 

Since the parents size and position also depends on its own parent, its impossible 
to precisely define the size and position of a widget without taking the whiole tree into consideration 

If a child wants a differnt size from its parent and the parent doesn't have enough information to align it, the childs size may be ignored Be specific when defining when deifining alignment 


When a widget tells its child that it must be of a certain size, we say that the widget supplies tight constraints tits child

# Tight vs Loose Constraints

## Tight Constraints 

A tight constraints offers a single possibility , an exact size . In other words , a tight constraint has its maximum height equal to its minimum height

If you go to Flutter’s box.dart file and search for the BoxConstraints constructors, you’ll find the following:
content_copy
BoxConstraints.tight(Size size)
   : minWidth = size.width,
     maxWidth = size.width,
     minHeight = size.height,
     maxHeight = size.height;

## Loose Constraints

A loose constraint on the other hand, sets the maximum width and height , but lets the widget be as small as it wants on other words a loose constraint has a minimum height and width both equal to zero

BoxConstraints.loose(Size size)
   : minWidth = 0.0,
     maxWidth = size.width,
     minHeight = 0.0,
     maxHeight = size.height;

Knowing the general layout rule is necessary, but it’s not enough.
Each widget has a lot of freedom when applying the general rule, so there is no way of knowing what it will do by just reading the widget’s name.
If you try to guess, you’ll probably guess wrong. You can’t know exactly how a widget behaves unless you’ve read its documentation, or studied its source-code.
The layout source-code is usually complex, so it’s probably better to just read the documentation. However, if you decide to study the layout source-code, you can easily find it by using the navigating capabilities of your IDE.

In flutter, widgets are rendered by their underlying RenderBox object, Render boxes are given constraints by their parents and size themselves within those constraints .Constraints consist of minimum and maximum widths and heights ,sizes consist of a  specific width and height
