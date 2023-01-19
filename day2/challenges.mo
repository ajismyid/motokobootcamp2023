import nat "mo:base/Nat";
import array "mo:base/Array";
import int "mo:base/Int";
import char "mo:base/Char";
import text "mo:base/Text";
import iter "mo:base/Iter";
import buffer "mo:base/Buffer";

actor{

    //average_array(array : [Int]) -> async Int
    public func average_array(array : [Int]) : async Int {
        //let array = array;
        var counter = 0;
        var sum : Int = 0;
        for (element in array.vals()) {
            sum += element;
            counter += 1;
        };
        sum/counter;
    };

    //count_character(t : Text, c : Char) -> async Nat 
    public func count_character(t : Text, c : Char) : async Nat {
        var counter : Nat = 0;
        for (ch in t.chars()){
            if (ch == c){
                counter += 1;
            };  
        };
        counter;
    };

    //factorial(n : Nat) ->  async Nat
    public func factorial(n : Nat) : async Nat {
        var fact : Nat = 1;
        for (i in iter.range(1, n)){
            fact *= i;
        };
        fact;
    };
    
    //number_of_words(t : Text) -> async Nat 
    public func number_of_words(t : Text) : async Nat {
        var counter = 0;
        for (word in text.split(t : Text, #char ' ')){
            counter += 1;
        };
        counter;
    };

    //find_duplicates(a : [Nat]) -> async [Nat]
    public func find_duplicates(a : [Nat]) : async [Nat] {
        //create list of unique elements
        var element : [Nat] = [];
        for(number in a.vals()){
            if (Array.find<Nat>(element, func x = x == number) != null){} else {
            element := Array.append<Nat>(element, [number]);
            };
        };
    
        //create list of unique element that has duplication
        var duplicated : [Nat] = [];
        var counter = 0;
        for(number_e in element.vals()){
            for(number_a in a.vals()){
                if(number_e == number_a){counter += 1} else {};
            };
            if (counter > 1){ duplicated := Array.append<Nat>(duplicated,[number_e])};
            counter := 0
        };
        return duplicated;
    };

    //convert_to_binary(n : Nat) -> async Text
    public func convert_to_binary(n : Nat) : async Text {
        var string : Text = "";
        var quotient : Nat = n;
        var remainer : Nat = 0;
    
        if (quotient == 0){return "";} else {
            loop { 
            remainer := quotient%2;
            string := text.concat(nat.toText(remainer), string);
            quotient := quotient/2 } while { quotient > 0 };
        return string;};  
    }; 
}