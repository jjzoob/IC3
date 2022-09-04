
import Nat "mo:base/Nat";
import Blob "mo:base/Blob";
import Text "mo:base/Text";

import Types "types";


// Create a simple Counter actor.
actor Counter {
  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

  //http_request
  public query func http_request(arg: Types.HttpRequest): async Types.HttpResponse {
    
    let content:Blob = Text.encodeUtf8("<html><body><h1>The currentValue is "#Nat.toText(currentValue)#".</h1></body></html>");

    {
      body = Blob.toArray(content);
      headers = [];
      status_code = 200;
      streaming_strategy = null;
    }
  }
}