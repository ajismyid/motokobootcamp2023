# **Day 4**

1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?<br>  
   >*Yes, the heap memory is saved during upgrading a canister. Currentyly each canister can have at most 4Gb of heap memory.*<br>

2. How much accounts can a unique Principal own?<br>
  
   >*Answer: 4,294,967,295 accounts. A 32-bit unsigned integer has a maximum value of 4,294,967,295*<br>
   
3. Can we safely upgrade a canister from interface A to interface B?<br>
   ```
   //Interface A
   actor {
      public func greet(surname : Text, firstname : Text) : async Text {
      return "Hello" # firstname # surname # " !";
      };
   }
   ```
   
   ```
   //Interface B
   actor {
      public func greet(firstname : Text) : async Text {
      return "Hello" # firstname # " !";
      };
   }
   ```  
   >*Answer: Yes, because the upgrade is limited to not change the type of stable data*<br>

