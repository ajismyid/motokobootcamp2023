import Array "mo:base/Array";
import Int "mo:base/Int";

actor {
  //second_maximum(array : [Int]) ->  Int;
  public func second_maximum(array : [Int]) : async Int {
    let len : Int = array.size();
    var counter : Int = 1;
    var second_max : Int = 0;
    for (num in array.vals()){
      second_max := num;
      counter += 1;
      if (counter == len){
        return second_max;
        };
    };
    return second_max;
  };

  //remove_even(array : [Nat]) -> [Nat];
  func odd_only(n : Nat) : Bool {
    n%2 != 0;
  };

  public func remove_even(array : [Nat]) : async [Nat]{
    return Array.filter<Nat>(array, odd_only);
  };

  //drop<T> : (xs : [T], n : Nat) -> [T]

  func drop<T>(xs : [T], n : Nat) : [T] {
    var newArray : [T] = [];
    for (key in xs.keys()){
      if (key + 1 > n){newArray := Array.append(newArray, [xs[key]])}    
    };
    return newArray;
  };  
};