import nat "mo:base/Nat";
import array "mo:base/Array";
import int "mo:base/Int";
import char "mo:base/Char";
import text "mo:base/Text";
import iter "mo:base/Iter";
import buffer "mo:base/Buffer";
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
}
