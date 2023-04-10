import 'package:flutter/material.dart';
import 'package:navigation_in_flutter/main.dart';

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
  // Book _selectedBook = Book('default title','default author');
  // Book? _selectedBook = null; redeundant initialization to null , remove the initializer
  Book? _selectedBook;
  bool show404 = false;

  List<Book> books = [
    Book('Left hand of Light and Love', 'joeman'),
    Book('Too Like Book and Programing', 'Ibukunoluwa'),
    Book('AntiFragile', 'Nasim Taleb'),
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
                    BooksListScreen(books: books, onTapped: _handleBookTapped)),
            if (show404)
              MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
            else if (_selectedBook != null)
              MaterialPage(
                  key: ValueKey(_selectedBook),
                  child: BookDetailsScreen(book: _selectedBook))
          ],
          onPopPage: (route, result) => route.didPop(result),
        ));
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListScreen({required this.books, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            for (var book in books)
              ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
                onTap: () => onTapped(book),
              )
          ],
        ));
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(book.title,style: Theme.of(context).textTheme.headlineSmall),
              Text(book.author, style: Theme.of(context).textTheme.titleMedium),
            ]
          ]
        ),
      ),
    );
  }
}
