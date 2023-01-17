
actor {
  //multiply(n : Nat, m : Nat) -> async Nat
  public func multiply(n : Nat, m : Nat) : async Nat {
    return n * m;
  };

  //volume(n : Nat) -> async Nat
  public func volume(n : Nat) : async Nat {
    return n**3;
  };

  //hours_to_minutes(n : Nat) -> async Nat
  public func hours_to_minutes(n : Nat) : async Nat {
    return n*60;
  };

  //set_counter(n : Nat) -> async ()
  //get_counter() -> async Nat
  var counter: Nat = 0;

  public func set_counter(n : Nat) : async() {
    counter := n;
  };

  public func get_counter() : async Nat {
    return counter;
  };

  //test_divide(n: Nat, m : Nat) -> async Bool
  public func test_divide(n : Nat, m : Nat) : async Bool {
    return n%m == 0;
  };

  //is_even(n : Nat) -> async Bool
  public func is_even(n : Nat) : async Bool {
    return n%2 == 0;
  };
}



