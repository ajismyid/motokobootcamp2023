import List "mo:base/List";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";
import Bool "mo:base/Bool";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";

actor{

    //Day 4
    //Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
    //unique<T> : (l : List<T>, equal: (T,T) -> Bool) -> List<T> 
  
    public func unique (list : List.List<Int>) : async List.List<Int> {
        var newlist : List.List<Int> = List.nil<Int>(); 
        var counter = 0; 
        for (element1 in List.toIter(list)){
            for (element2 in List.toIter(newlist)){
                if (element1 == element2){ counter += 1 };
            };
            if (counter == 0) { newlist := List.push<Int>( element1, newlist ) };
        };
        return newlist;
    };

    //Write a function reverse that takes l of type List and returns the reversed list.
    //reverse<T> : (l : List<T>) -> List<T>;
    
    func reverse<T>(list : List.List<T>) : List.List<T> {
        func rec(list : List.List<T>, r : List.List<T>) : List.List<T> {
            switch list {
                case null { r };
                case (?(h, t)) { rec(t, ?(h, r)) }
            };
        };
        rec(list, null);
    };

    //Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    //is_anynomous : () -> async Bool; 
    
    public shared ({ caller }) func is_anynomous() : async Bool{
        return Principal.isAnonymous(caller);
    };

    //Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
    //find_in_buffer<T> :  (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) -> ?Nat
    
    func find_in_buffer<T>(buf: Buffer.Buffer<T>, val: T) : ?Nat {
        var index : ?Nat = null;
        for (i in Iter.range(0, buf.size()-1)) {
            if (buf.get(i) == val){
                index := ?i;
                return index;
            }
        };
        return index;
    };

    //Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    //get_usernames : () -> async [(Principal, Text)];
    
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
        usernames.put(caller, name);
    };
    
    public query func get_usernames() : async [(Principal, Text)] {
        var buffer = Buffer.Buffer<(Principal, Text)>(3);
        for (pair in usernames.entries()){
            buffer.add(pair);
        };
        return Buffer.toArray(buffer);
    };
}
