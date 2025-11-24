import 'dart:io';

class Book {
  String title;
  String author;
  int year;
  bool isBorrowed = false;

  Book(this.title, this.author, this.year);

  void borrowBook() {
    if (isBorrowed) {
      print("The book '$title' is already borrowed.");
      return;
    } else {
      isBorrowed = true;
      print("You have borrowed '$title' book successfully.");
    }
  }

  void returnBook() {
    isBorrowed = false;
    print("You have returned '$title' book.");
  }
}

class Library {
  final int maxCapacity = 70;
  List<Book?> books = List.filled(70, null);
  int bookCount = 0;

  //Library() {
  // books = List.filled(70, null);
  //}

  void addBook(Book book) {
    if (bookCount >= 70) {
      print("Library capacity reached. Cannot add book: ${book.title}");
      return;
    }

    books[bookCount] = book;
    bookCount++;

    print("You have added: ${book.title} successfully");
  }

  void listAvailableBooks() {
    print("\nAVAILABLE BOOKS:");

    for (int i = 0; i < bookCount; i++) {
      Book? book = books[i];

      if (book != null && book.isBorrowed == false) {
        print(
          "Title: ${book.title}, Author: ${book.author} Year: ${book.year} ",
        );
      }
    }
    print(" ");
  }

  void searchByTitle(String keyword) {
    print("\nSearched Results:");

    for (int i = 0; i < bookCount; i++) {
      Book? book = books[i];

      if (book != null) {
        String bookTitleLower = book.title.toLowerCase();
        String keywordLower = keyword.toLowerCase();

        if (bookTitleLower.contains(keywordLower)) {
          String status = book.isBorrowed ? " (Borrowed)" : " (Available)";
          print(" There is: ${book.title} by ${book.author}$status");
        }
      }
    }
    print(" ");
  }
}

//This is an helper function for our main logic

void _borrowReturnBook(
  Library library,
  String title, {
  required String action,
}) {
  bool found = false;

  for (int i = 0; i < library.bookCount; i++) {
    Book? book = library.books[i];

    if (book != null && book.title.toLowerCase() == title.toLowerCase()) {
      if (action == 'borrow') {
        book.borrowBook();
      } else {
        book.returnBook();
      }

      found = true;
      break;
    }
  }

  if (!found) {
    print("The book with $title not found in the library");
  }
}

//================ Main Function ================
void main() {
  var library = Library();

  library.addBook(Book("Purple Hibiscus", "Chimamanda Ngozi Adichie", 2003));
  library.addBook(Book("Things Fall Apart", "Chinua Achebe", 1958));
  library.addBook(Book(" Palm-Wine Drinkard", "Amos Tutuola", 1952));
  library.addBook(Book("Pride and Prejudice", "Jane Austen", 1813));
  library.addBook(Book("Efuru", "Flora Nwapa", 1966));
  library.addBook(Book("To Kill a Mockingbird", "Harper Lee", 1960));
  library.addBook(Book("The Joy of Motherhood", "Buchi Emecheta", 1979));
  library.addBook(Book("The Fishermen", "Chigozie Obioma", 2015));
  library.addBook(Book("Stay with Me", "Ayobami Adebayo", 2017));
  library.addBook(Book("Children of Blood and Bone", "Tomi Adeyemi", 2018));
  library.addBook(Book("The famished road", "Ben Okri", 1991));
  library.addBook(Book("People of the City", "Cyprian Ekwensi", 1954));

  print("\nBorrowing 4 books from the library : ");

  library.books[2]?.borrowBook();
  library.books[5]?.borrowBook();
  library.books[8]?.borrowBook();
  library.books[10]?.borrowBook();
  print(" ");

  bool running = true;

  while (running) {
    print("\nLibrary Menu");

    print("1. List available books");
    print("2. Search book by title");
    print("3. Borrow a book");
    print("4. Return a book");
    print("5. Exit");
    print("Enter your a number to interact with the Library1:");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        library.listAvailableBooks();
        break;

      case '2':
        print("Enter keyword to search: ");
        String? keyword = stdin.readLineSync();
        if (keyword != null && keyword.isNotEmpty) {
          library.searchByTitle(keyword);
        }
        break;

      case '3':
        print("Enter the TITLE of the book to borrow: ");
        String? titleToBorrow = stdin.readLineSync();
        if (titleToBorrow != null) {
          _borrowReturnBook(library, titleToBorrow, action: 'borrow');
        }
        break;

      case '4':
        print("Enter the TITLE of the book to return: ");
        String? titleToReturn = stdin.readLineSync();
        if (titleToReturn != null) {
          _borrowReturnBook(library, titleToReturn, action: 'return');
        }
        break;

      case '5':
        running = false;
        print("Exiting Library App. Goodbye!");
        break;

      default:
        print("Invalid choice. Please enter a number between 1 and 5.");
    }
  }
}
