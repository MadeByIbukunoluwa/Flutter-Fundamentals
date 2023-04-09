import 'package:flutter/material.dart';

void main() {
  runApp(const BooksApp());
}

class Book {
  final String title;

  final String author;

  Book(this.title, this.author);
}

class BooksApp extends StatefulWidget {
  const BooksApp({super.key});

  @override
  State<BooksApp> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book _selectedBook;
  bool show404 = false;

  List<Book> books = [
    Book('Left hand of Light and Love','joeman'),
    Book('Too Like Book and Programing','Ibukunoluwa'),
    Book('AntiFragile','Nasim Taleb')
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Books App',
        home: Navigator(
          pages: [
            MaterialPage(
              key: ValueKey('BooksListPage'),
              // child: Scaffold(),
              child:
            )
          ],
          onPopPage: (route, result) => route.didPop(result),
        ));
  }
}



class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped; 

  BooksListScreen({required this.books, required this.onTapped});

  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView(
        children: [
          for (var book in books) 
          ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () => onTapped(book),
          )
        ],
      )
    );
  }
}