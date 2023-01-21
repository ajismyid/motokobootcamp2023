import book "./book";
import list "mo:base/List";
import array "mo:base/Array";


//import this type in your main.mo and create a variable that will store a book.
//In main.mo import the type List from the Base Library and create a list that stores books.

actor {
  
  var Lib : [book.Book] = [];

  //In main.mo create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list. Then create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.
  
  public func add_book(t: Text, p: Nat) : async () {
    var newbook = book.create_book(t , p);
    //newbook := list.fromArray(newbook);
    Lib := array.append(Lib, [newbook]);
  };

  //public func get_book() : async [book.Book] {
  //  return Lib;
  //};
  
  public func get_book() : async list.List<book.Book> {
    return list.fromArray(Lib);
  };
}
