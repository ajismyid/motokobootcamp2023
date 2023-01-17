##**Day 1**

1. How much is the current memory capacity of a canister?<br>
   >*Answer: 4Gb*

2. What is the issue with the following code sample?<br>
  ```
  actor {
    let counter : Nat = 0;
    public func increment_counter() : async () {
      counter := counter + 1;
   };
  }
  ```  
  
   >*Answer: variable counter is set immutable*

3. What is the issue with the following code sample?<br>
  ```
  actor {
    var message : Text = 0;

    public query func change_message(new_message : Text) : async () {
      message := new_message;
      return;
    };
  
    public query func see_message() : async Text {
      return(message);
    };
  }
  ```  
  
   >*Answer: variable message type is Text, cannot be assigned with Nat / Int*

4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.<br>
   >*Answer: False*
