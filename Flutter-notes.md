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

We invoke notifyListeners() so that any object listening to the appState will be notified that it a has changed

In order to manage complexity , it is important to separate different parts of your UI into different or separate widgets

To extract a piece of code , into a widget in VS Code , move your cursor to the line , then press Cmd + . And a prompt will open

Flutter uses composition over inheritance , so something like padding isn’t part of text, its a widget too

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
            - For example, if your max width is greater than your width breakpoint return a Scaffold object with a row that has a list in the left , you can also adjust your display based on devices height , the aspect ratio or some other property
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

Attempts to size the child to a specific aspect ratio

# ConstrainedBox

Imposes size constraints on its child, offering control over the minimum or maximum size

# CustomSingleChildLayout

- Uses a delegate function to position a single child, The delegate can determine the layout constraints and positioning for the child

# Expanded or Flexible -

 Allows a child of a Row or Column to shrink or grow to fill any available space

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
 a constraint is a set of 4 doubles, and a minimum and maxiumum height

 The widget goes through its own list of children. One by one, the widget tells its children
 what their constraints areand then asks each child what size it wants to be

 Then, the widget positions its children (horizontally in the x-axis, and vertically in the y-axis) one by one

 Finally, the widget tells its parents about its own size, (within the original constraints, of coursea)

## Limitations

A widget can decide its own size only within the constraints given to it by its parent
This means a widget can't have any size it wants

A widget can't know and doesn't decide its own position on the screen since its the widgets parent who decides the position of the widget

Since the parents size and position also depends on its own parent, its impossible
to precisely define the size and position of a widget without taking the whiole tree into consideration

If a child wants a different size from its parent and the parent doesn't have enough information to align it, the childs size may be ignored Be specific when defining when deifining alignment

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

# Adding interactivity to widgets by managing state

A widget is either stateful or stateless , if a widget can change , when a user can interact with it , for example its statetful

## Stateless Widget  

A stateless widget never changes , eg Icon , IconButton , Text are all examples of stateless widgets they subclass StatelessWidget

## Stateful Widget  

A stateful widget is dynamic for example , it can changes its appearance in response to events triggered by user interactions or when it receives data
Stateful widgets subclass StatefulWidget

A widgets state is stored in a state object separating the widgets state from its appearance , the state consists of values that can change when the widgets state changes , the state object calls setState() telling the framework to redraw the widget

## They are different approaches of managing state

ALWAYS REMEMBER , IF IN DOUBT , START BY MANAGING STATE IN THE PARENT WIDGET

There are several valid ways to make your widget interactive , that is there are different approaches of managing state there a re three common ways to manage your state

- The widget manages its own state
- The parent manages the widget’s state
- A mix and match approach

How do you decide which approach to use

If the state in question is user data , for example the checked or unchecked state of a checkbox or the position of a slider then the state is best managed by the parent widget

If the state in question is aesthetic , for example an animation , then the state is best managed by the widget itself

## Why do always see use the 'const' keyword to improve performance

<https://www.fluttercampus.com/guide/187/how-to-fix-all-const-warnings-in-flutter-dart/>

## Additional Notes

In short, because when you mark the top-most widget in the tree with a const keyword, all its inner widgets will also use a const constructor, so there is no need to add those extra const keywords. If a inner widget does not have a const constructor, then your code won't compile.

## Assets and Images

Flutter apps can use both code and assets . An asset is a file bundled and deployed with your app, 
Flutter uses the pubspec.yaml located at tht root of the app to identify assets required by tha app

Loading Images
Flutter can load resolution-appropriate images for the current device ratio

you can sepcify the device pixel ratio that a particular image or images are intended for

to load an image ue the AssetImage class in a widget's build method

You can also share assets with te underlying platform

# Material Design  

Material Design is an open source design sysytem built and supported by Gogle supporters and developers

# Navigation and Routing  

Flutter provides a complete system for navigating between screens and handling deep links.Small applications without deeplinking can use Navigator , while more complex applications with more navigation requirements require Router to corrctly handle deeplinks in Android and ios , and also stay in sync with the browser

Navigator.push(widget) when it is called , it places the called widget on top of the initial widget

note - you can also use named routes , but it is not recommended for most apllications

Flutter applications with advacned rotuing requirements should use a package such as go_router

Don't invoke 'print' in production code. Try using a logging framework. - import debugPrint or log from dart:developer

# Navigator 2.0

The navigator 2.0 API adds new class to the framework in order to make the apps screens a function of the app state and to provide the ability to parse routes from the underlying platform (like weURLs)

Page — an immutable object used to set the navigator’s history stack.
Router — configures the list of pages to be displayed by the Navigator. Usually this list of pages changes based on the underlying platform, or on the state of the app changing.
RouteInformationParser, which takes the RouteInformation from RouteInformationProvider and parses it into a user-defined data type.
RouterDelegate — defines app-specific behavior of how the Router learns about changes in app state and how it responds to them. Its job is to listen to the RouteInformationParser and the app state and build the Navigator with the current list of Pages.
BackButtonDispatcher — reports back button presses to the Router

## Flutter Navigator

A flutter Navigator manages a stack of Route Objects and a stack of overlays that are displayed on top.
Routes aren't widgets , they are objects that have a widget.A routes widget can be a gully opaque page or a smaller user interface part like a dialog or menu

## Quick Facts to keep in mind

Navigators have push and pop methods for managing the stack of routes

Navigators support lazily creating routes. Lazily created routes are identified by a path name.

By default the navigator displays the route called ‘/’.

Any widget can push or pop routes on its navigator ancestor with the static Navigator.push and Navigator.pop methods.

Routes are lazily generated by the navigators onGenerateRoute callback and each route's wdget is constructed by a MaterialPageRoute  builder callback

# Deeplink

A deeplink is a link that sends users to a destination in your app rather than a web page 

A weblink is a link that usees Http or Https scheme

An android app link is a subset of a web link that prvides a beter user experience

## Why deeplinks ?

They offer seamless UX by directing users to specific locations within your app 
They can be used to drive more profit to your app

With Deeplinks you can include targeted / personalized app experiences (increase app signuos , activations and post retention)

They drive long term engagement

# keys

Without a unique key , the framework cant determine whe to show a transition animation between different pages 

# Global keys and preserving a widgets state

Each time a widget tree is rebuilt, flutter preserves the state of the widget that occupy the same place in the tree, and have the same key that they did in the previous frame .

Most widgets are created wihtout a key, so thsis simplifies to same runtime type and same tree location .
A widget with a Global key is treated differently

Its state and its subtree are moved if the keyed widget moves to a new location when the tree rebuilds 

# Pages

The Navigator has a new pages argument in its constructor. If the list of Page obejct changes, Navigator updates the stack of routes to match

# Url Strategy

Flutter web apps have two ways of configuring URL - based navigation on the web 

# Publishers Glossary

A file named pubspec.lock that specifies the concrete versions and other information for every immediate and transitive dependency a package relies on

[non nullable instance field must be initialized](<https://stackoverflow.com/questions/67034475/non-nullable-instance-field-must-be-initialized>)

# Animations in Flutter

Well designed UIs feel more intuitive and contribute more the the overall feel of a polished app , improving User Experience
Flutter’s animation support makes it easy to implement a variety of animation types. Many widgets, especially Material widgets, come with the standard motion effects defined in their design spec, but it’s also possible to customize these effects.

## How to choose which Flutter Animation Widget is right for you

There are a lot of Animation Widgets in flutter and choosing on might feel overwhelming

## refer to image

Broadly speaking there are two types of animations

### Code based animations -

these are widget focused and are rooted in standard layout and style primitves likr rows, columns,colors,or text styles

### Drawing based animations

They look like someone drew them , they are often standalone sprites , like game characters or involve transformations that would be challenging to code

# Question 1

is my animation more like a drawing , or does it look ike somthing i can build out of Fluter widget primitives 
if yes, then it is best to make the animation outside of flutter with a tool like lottie and export it to flutter 

if no , flutter code bssed animations come in two flavors implicit and explicit

## Types of Code Based Animations

- Implicit animations simply reply on setting a new value for some widget property and Flutter takes care of animating from the current value to the newest value the widgets are easy to use and are very powerful, they are a good place to start wehn animating something

- Explicit animations on the other hand require you to use an AnimationController, they are called explicit because they only start animating when explicitly asked to , you can use explicit animations to do everything you do with implicit animations and more , the only caveat is that you have to manage the lifecycle of your AnimationController since its not a widget

## How to determine which type of widget you need

- Does my animation repeat forever ( while its on a certain screen , while a condition is true , etc )

- Are the values in my animation discontinuous ? For example a, a growing circle animation , the circle repeatedly grows frm small to large then shrinking (the circles size is discontinuous)

- Are multiple widgets animating in a coordinated fashion together

If you answered yes to any of the questions above, youneed to use an explicit widget, other wise you cna use an implicit widget

## Which widget should i pick

Ask yourself, "is there a widget built for my needs?" if you're looking for a built in animated widget, look for a widget named "AnimatedFoo" where Foo is the name of the property you want to animate eg (AnimatedOpacity)

If you can't find the built-in implicit animation you need you can use TweenAnimationBuilder to create custom implicit animations

## Can find a relevant built-in explicit animation

If you can't , ask yourself : Do i want my animation to be a standalaone widget or part of anohter surrounding widget

If you want a standaline custom explicit animation you should extend AnimatedWidget
If not you can use Animated Builder

Theres one last option to consider if you are having performance problems and that is animating with CustomPainter

you can use it much like AnimatedWidget, but CustomPainter paints directly to the Canvas, without the standard widget build paradigm. When used well, you can create some neat, extremely custom effects or save on performance. When misused, though, your animation could cause more performance issues.

## Animation basics with implicit animations 

Flutter includes series of widgets that are animated version of existing widgets 
eg, AnimatedContainer version of Container Widget , AnimatedPosition version of Positioned widget
These widgets automatially animate changes to their properties , when you rebuild the widget with new property values , the widget handles driving the animation from the previous value to the new value
When you change the Container widget to the AnimatedCointainer widget the container gradually animates from the previous width value to the new value , the process is called interpolation 
and this applies to all of its properties.
We can also control the way the widget interpolates from the old value to the new value by using a curve.Curves control the rate of change overt ime and help your animations feel more realistic 

Also you don't necessarily need to place these widgets into a stateful widget and use setState you can use StreamBuilder and FutureBuilder to trigger animations 

Implicit animations gave us the ability to put some basic animations into our app

These animations typically go in one direction tweening from start to end , where they stop
Behind the scenes, flutter is taking control, assuming intentions and disposing of any need for you to worry about the transition from one thing to the next

We can gain more control over our animations using TransitionWidgets

Transition widgets are a set of flutter widgets whose name end in transition eg DecoratedBoxTransition, SizeTransition, ScaleTransition, Positioned Transition, etc (they look and feel like animatedX widgets) but they is one major difference - they are extensions of AnimatedWidget

Animation Controller - this handles listening for ticks and gives us some useful controls over what the animation is doing - we nend to create it in a stateful widget though

vsync - this gives flutter a reference to the object to notify about changes

### No directionality widget found

Flutter doesn't know whether the text is LTR or RTL so you ned to tell it explicitly

[Visit Link](<https://stackoverflow.com/questions/49687181/no-directionality-widget-found>)

## Custom Implicit Animations in Flutter with TweenAnimationBuilder

we are going to state the best use cases for TweenAnimationBuilder versus when a different widget is best for the job

why use TweenAnimationBuilder ?

Suppose we want to create a basic animation: an animation that doesn't repeat forever and is just one widget or widget tree 
If we need to create a basic animation and none of the build in implicit animations eg AnimtedContainer, AnimatedPadding etc is not what we are looking for we can crreate the animations with TweenAnimationBuilder 

Color.lerp - this is used to linearly interpolate between two values

lerp lerping - meaning
Lerping (Linear Interpolation) provides the intermediary steps of a transition. Calculated over time, it can convey the visual movement of objects. For example, imagine a coin on a ruler. At the start of our animation, the coin is at the 0cm mark. After 3 seconds, it is at the 30cm mark.

### Additional Notes for implicit animations

Slider widgets require a Material widget ancestor.
// In Material Design, most widgets are conceptually "printed" on a sheet of material. In Flutter's material library, that material is represented by the Material widget. It is the Material widget that renders ink splashes, for instance. Because of this, many material library widgets require that there be a Material widget in the tree above them.

// To introduce a Material widget, you can either directly include one, or use a widget that contains Material itself, such as a Card, Dialog, Drawer, or Scaffold.

// there is isn't a built in widget that applies an arbitrary color filter to a widget , but we can build one with TweenAnimationBuilder , to change the color over time, we want to modify the color we are applying to the filter
// A Tween is just the range of values we are animating between

// Tweens are mutable, so if you're always going to animate between the same set of value, its best to declare the Tween as a a static final variable in your class , that way you dont create a new object everyitm your build

## How to build explicit animations in flutter

Suppose you need to add an animation to your application which rpeats multiple times nad needs to be able to pause or resume in response to something , you'll need an explicit animation for explicit animations you ned an animationcontroller, for implict animations , you don't 
If you've determined that you are going to use an explicit animation there is a wide array of host explicit animation classes to choose from , you should fisrst check out if you can use any one of these wdigets to accomplish your needs first , if they don't have what you are looking for, then you can build your own using  AnimatedWidget or AnimatedBuilder

That’s a vote in favor of using AnimatedWidget whenever possible. However, if your parent widget that creates the animation controller is pretty simple, maybe making a separate standalone widget just for your animation is too much extra code. In that case, AnimatedBuilder is all that you need.


## Animation Deep Dive 
Animations in flutter are just a quick succession of changing the state 60 or 120 times per second , they are a way o rebuilding parts of your widget tree on every frame , yes, flutter is fast enough to do that 

We will build an animation from first principles with TickerController and setState
Animation fast consecutive ripples of widgets
## Note

Always remember to add images to the pubspec.yaml file first or else when you use Image.asset to and put the file location it will not work

ticker - a ticker is an Object thst calls a function for very frame 

Scheduler - the flutter scheduler library is responsible for scheduler frame callbacks 
and tasks at given priorities , it alos makes sure tasks are running when appropriate , eg. and idle task is executed when no animation is running 

## Types of Animation 
Twwen animation 
Physics based animation 
pre canned animation 

## Common Animation 
Animated List or Grid 
Shared Element Transition 
Staggered Animation 

## animations
Animation , a core class in Flutters animation library, interolates the values used to guide an animation 

an AnimationController manages the animation 

A curvedAnimation defines progression as a non linear curve 

A tween interpolates between the raneg of data as used by the object being animated 

use listeners and statuslisteners to monitor state changes 



## Essential animation concepts and classes



Moving to a new development stack makes you aware of your priorities. Near the top of my list are these three:

Strong concepts deal effectively with complexity by providing simple, relevant ways of structuring thoughts, logic, or data.
Clear code lets us express those concepts cleanly, without being distracted by language pitfalls, excessive boilerplate, or auxiliary detail.
Fast iteration is key to experimentation and learning — and software development teams learn for a living: what the requirements really are, and how best to fulfill them with concepts expressed in code.

How do you enter into a new field of programming? Experimentation is obviously key, as is studying and emulating programs written by more experienced peers. I personally like to complement these approaches with concept mining: Trying to work from first principles, identifying concepts, exploring their strength, deliberately seeking their guidance. It is a rationalistic approach which cannot stand on its own, but one that is intellectually stimulating and may lead you to deeper insights faster.


In flutter, the user interface is defined by a tree of immutable widgets which is build via a foxtrot of constructor calls (where you get to configure widgets) and build methods (where widget implementatiosn get to decide how their subtrees look). The resulting tree structure for our app is shown below , with the main role of each widget in parentheses , each conrete widget type has a very focused responsibility 



## Tween
Enter tweens. While far from unique to Flutter, they are a delightfully simple concept for structuring animation code. Their main contribution is to replace the imperative approach above with a functional one. A tween is a value. It describes the path taken between two points in a space of other values, like bar charts, as the animation value runs from zero to one.

## Hero Animations 
Hero refers to the widget that flies between screens 

Flying an image or widget from one screen to another is called Hero Transition or animation though it can also be called shared element transition 


## Staggered Animations
A staggered animation consists of sequential or overlapping animations 




## Advanced UI


### Fonts 
Typography covers the style and appearance of type or fonts , it specifies how heavy the font is and other visual aspects of the text 
Variable Fonts allows you to control pre defined aspects of text styling 
### Gestures 
The gesture system in flutter has two separate layers 

the first layer has raw pointer events that describe the location and movemnet of pointers 

the second layer has gestures that describe semantic actions that consists of one or more pointer 

pointers represent raw data about the users interaction with the device's screen 

Gestures represents semantic actions 

## Actions and Shortcuts 
For an application to do naything it has to have actions - users want to tell the application to do something 

Flutters actions and shortcuts system allows users developers to define actions that fulfil intents bound to them , in this context an intent is a generic action that the user wants to perform 

Why separate Actions from Intents?
You might wonder: why not just map a key combination directly to an action? Why have intents at all? This is because it is useful to have a separation of concerns between where the key mapping definitions are (often at a high level), and where the action definitions are (often at a low level), and because it is important to be able to have a single key combination map to an intended operation in an app, and have it adapt automatically to whichever action fulfills that intended operation for the focused context.
