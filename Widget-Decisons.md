# Decisions for choosing widgets in flutter

1. Do I need to group my widgets together?
    - Yes: Go to step 2.
    - No: Go to step 4.

2. Do I need to position the widgets inside the group? or do i need to create a row or column of widgets
    - Yes: Go to step 3.
    - No: Use a Column or Row widget to group the widgets.

3. Do I need to position the widgets absolutely or relative to the group?
    - Absolutely: Use a Stack widget to group and position the widgets.
    - Relative: Use a Positioned widget inside the Stack to position the widgets.

4. Do I need to apply constraints to my widgets?
    - Yes: Go to step 5.
    - No: Use a Container widget to group the widgets.

5. Do I need to apply fixed constraints or flexible constraints?
    - Fixed: Use a SizedBox or ConstrainedBox widget to apply fixed constraints.
    - Flexible: Use a Expanded or Flexible widget to apply flexible constraints.

6. Do I need to display widgets in a grid-like pattern?
    - Yes: Go to step 7.
    - No: Go to step 9.

7. Do I need a fixed or flexible grid?
    - Fixed: Use a GridView.count widget.
    - Flexible: Use a GridView.builder widget.

8. Do I need to display widgets in a custom grid pattern?
    - Yes: Use a GridView.custom widget.
    - No: Go to step 9.

9. Do I need to display widgets in a tabular form?
    - Yes: Go to step 10.
    - No: Go to step 12.

10. Do I need a fixed or flexible table?
    - Fixed: Use a Table widget.
    - Flexible: Use a DataTable widget.

11. Do I need to display widgets in a custom table pattern?
    - Yes: Use a CustomMultiChildLayout widget.
    - No: Go to step 12.

12. Do I need to display widgets in a flow-like pattern?
    - Yes: Go to step 13.
    - No: Go to step 15.

13. Do I need to display widgets in a linear flow?
    - Yes: Use a Wrap widget with a direction of Axis.horizontal.
    - No: Go to step 14.

14. Do I need to display widgets in a non-linear flow?
    - Yes: Use a Flow widget.
    - No: You're done!

15. Do I need to display widgets in a list-like pattern?
    - Yes: Go to step 16.
    - No: Go to step 18.

16. Do I need to display widgets in a vertical or horizontal list?
    - Vertical: Use a ListView widget.
    - Horizontal: Use a ListView widget with a scrollDirection of Axis.horizontal.

17. Do I need to display widgets in a custom list pattern (do i need a Fixed number of items)?
    - Yes: Use a ListView.builder widget.
    - No: You're done!

18. Do I need to create a scrollable view?
    - Yes: Go to step 19.
    - No: Go to step 20.

19. Do I need a vertical or horizontal scroll view?
    - Vertical: Use a SingleChildScrollView widget.
    - Horizontal: Use a SingleChildScrollView widget with a horizontal scroll direction.

20. Do I need to display widgets in a staggered grid-like pattern?
    - Yes: Go to step 19.
    - No: Go to step 23.

21. Do I need a fixed or flexible staggered grid?
    - Fixed: Use a StaggeredGridView.count widget.
    - Flexible: Use a StaggeredGridView.builder widget.

22. Do I need to display widgets in a custom staggered grid pattern?
    - Yes: Use a SliverGridDelegateWithFixedCrossAxisCount or SliverGridDelegateWithMaxCrossAxisExtent widget inside a CustomScrollView.
    - No: You're done!

23. Do I need to align a widget within a parent widget?
    - Yes: Use an Align widget.
    - No: Go to step 24.

24. Do I need to center a widget within a parent widget?
    - Yes: Use a Center widget.
    - No: Go to step 25.

25. Do I need to create a page view?
    - Yes: Use a PageView widget.
    - No: Go to step 26.

27. Do I need to create a tab view?
    - Yes: Use a TabBarView widget.
    - No: Go to step 28.

28. Do I need to create a bottom navigation bar?
    - Yes: Use a BottomNavigationBar widget.
    - No: Go to step 29.

29. Do I need to create a tab bar?
    - Yes: Use a TabBar widget.
    - No: Go to step 30.

30. Do I need to create a Sliver view?
    - Yes: Go to step 31.
    - No: Go to step 32.

31. Do I need to create a custom Sliver view?
    - Yes: Use a CustomScrollView widget.
    - No: Use a NestedScrollView widget.

32. 

