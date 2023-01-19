# **Day 2**

1. Who controls the ledger canister?<br>  
   >*CanisterID r7inp-6aaaa-aaaaa-aaabq-cai (NNS root)*<br>
   >Source: <br>
   >https://icscan.io/canister/ryjl3-tyaaa-aaaaa-aaaba-cai<br>
   >https://k7gat-daaaa-aaaae-qaahq-cai.ic0.app/listing/nns-root-10247/r7inp-6aaaa-aaaaa-aaabq-cai<br>

2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?<br>
  
   >*Answer: SubnetID pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe*<br>
   >*Answer: 16 nodes*<br>
   >Source: <br>
   >https://icscan.io/principal/k3f6a-5uxhv-dqjj6-762lc-yazgp-drpws-a35e7-wf27k-ujuio-ye2lh-xqe<br>

3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?<br>
   >*Answer: 16.875 voting power*<br>
   >Calculated as:<br>
   >(ICP staked + maturity staked) x Dissolve Delay Bonus x Age Bonus<br>
   >(10 + 0) x 1.5 x 1.125<br>
   
4. What is the issue with the following code?<br>
   ```
   actor {
      let n : Nat = 50;
      let t : Text = "Hello";

      public func convert_to_text(m : Nat) : async Text {
         Nat.toText(m);
      };
   }
   ```  
   >*Answer: Need to import Nat module "mo:base/Nat";*<br>

5. What is wrong with the following code?<br>
   ```
   actor {
      var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

      public func show_languages(language : Text) : async [var Text] {
         return (languages);
      };
   }
   ```  
   >*Answer: Would throw an error: public actor field name has non-shared function type var Text, sharing mutable data (var languages) is not allowed";*<br>

6. What is wrong with the following code?<br>
   ```
   actor {
      var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

      public func add_language(new_language: Text) : async [Text] {
         languages := Array.append<Text>(languages, [new_language]);
         return (languages);
      }; 
   }
   ```  
   >*Answer: Need to import module Array "mo:base/Array";*<br>