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

// class _BooksAppState extends State<BooksApp> {
//   // Book _selectedBook = Book('default title','default author');
//   // Book? _selectedBook = null; redeundant initialization to null , remove the initializer
//   Book _selectedBook = Book('default title', 'default author');
//   bool show404 = false;

//   List<Book> books = [
//     Book('Left hand of Light and Love', 'joeman'),
//     Book('Too Like Book and Programing', 'Ibukunoluwa'),
//     Book('AntiFragile', 'Nasim Taleb'),
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Books App',
//         home: Navigator(
//           pages: [
//             MaterialPage(
//                 key: ValueKey('BooksListPage'),
//                 // child: Scaffold(),
//                 child:
//                     BooksListScreen(books: books, onTapped: _handleBookTapped)),
//             if (show404)
//               MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
//             else if (_selectedBook != null)
//               MaterialPage(
//                   key: ValueKey(_selectedBook),
//                   child: BookDetailsScreen(book: _selectedBook))
//           ],
//           onPopPage: (route, result) => route.didPop(result),
//         ));
//   }

//   void _handleBookTapped(Book book) {
//     setState(() {
//       _selectedBook = book;
//     });
//   }
// }

// class BooksListScreen extends StatelessWidget {
//   final List<Book> books;
//   final ValueChanged<Book> onTapped;

//   BooksListScreen({required this.books, required this.onTapped});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: ListView(
//           children: [
//             for (var book in books)
//               ListTile(
//                 title: Text(book.title),
//                 subtitle: Text(book.author),
//                 onTap: () => onTapped(book),
//               )
//           ],
//         ));
//   }
// }

// class BookDetailsScreen extends StatelessWidget {
//   final Book book;
//   const BookDetailsScreen({super.key, required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           if (book != null) ...[
//             Text(book.title, style: Theme.of(context).textTheme.headlineSmall),
//             Text(book.author, style: Theme.of(context).textTheme.titleMedium),
//           ]
//         ]),
//       ),
//     );
//   }
// }

// Router
// the app an show different pages, but it can;t handle routes from the underlying platform
// The route information parser - it parses the route information into a user-definde data type

class _BooksAppState extends State<BooksApp> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser = BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {

  @override
  Future<BookRoutePath> parseRouteInformation( RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location as String);

    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return BookRoutePath.home();
    }
      //Handle 'book/:id'
    if (uri.pathSegments.length == 2) {
        if (uri.pathSegments[0] != 'book') return BookRoutePath.unknown();
        var remaining = uri.pathSegments[1];
        var id = int.tryParse(remaining);
        if (id == null) return BookRoutePath.unknown();
        return BookRoutePath.details(id);
    }
    return BookRoutePath.unknown();
  }

@override 
RouteInformation? restoreRouteInformation(BookRoutePath path) {
  if (path.isUnknown) {
    return RouteInformation(location: '/404');
  }
  if (path.isHomePage) {
    return RouteInformation(location: '/')
  }
  if (path.isDetailsPage) {
    return RouteInformation(location:'/book/${path.id}');
  }
  return null;
}

}
class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Book _selectedBook;

  bool show404 = false;

  List<Book> books = [
    Book('Left hand of darkness','Ursula K. Le Guin'),
    Book('Too Like finance, Technology and exercise', 'Ibukunoluwa Akintobi'),
    Book('Kindred','Harry Potter'),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null ? BookRoutePath.home() : BookRoutePath.details(books.indexOf(_selectedBook));
  }
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key:navigatorKey,
      pages: [
        MaterialPage(
          key:ValueKey('BooksListPage'),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
         ),
       ),
         if (show404) MaterialPage(key: ValueKey('Unknown Page'),child: UnknownScreen())
         else if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false ;
        }

        //Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }
    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > books.length - 1 ) {
          show404 = true;
          return;
      }
      _selectedBook = books[path.id];
    }
    else {
      _selectedBook = null;
    }
    show404 = false;
  }

  void _handleBookTapped(Book book) {
      _selectedBook = book;
      notifyListeners();
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({required this.book}) : super(key: ValueKey(book));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      }
    );
  }
}

class BookRoutePath {
  final int? id;
  final bool isUnknown;

  BookRoutePath.home()
      : id = null,
        isUnknown = false;

  BookRoutePath.details(this.id) : isUnknown = false;

  BookRoutePath.unknown() 
        : id = null,
          isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;

}

// The generic type defined on RouterDelegate is BookRoutePath which containa all the state neeeded to decid whihc pages to show

// we will need to move some logic from _BooksAppState to BookRouterDelegate and create a Globalkey
// here the app state is store directly on the RouterDelegate, but could e separated into another classs


class BooksListScreen extends StatelessWidget {

  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({super.key,required this.books, required this.onTapped});


  @override
  Widget build(BuildContext context) {
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





class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book,super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ... [
              Text(book.title, style: Theme.of(context).textTheme.headlineMedium),
              Text(book.author, style: Theme.of(context).textTheme.headlineSmall)
            ]
          ]
        )
      )
    );
  }
}





class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:const Center(child: Text('404'),)
    );
  }
}