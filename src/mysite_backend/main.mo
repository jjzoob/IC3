import Array "mo:base/Array";
import Qs "Quicksort"

actor {
    // 公共接口qsort
    public func qsort(arr : [Int]) : async [Int] {
        let acc_thawed : [var Int] = Array.thaw(arr);
        Qs.quicksort(acc_thawed);
        Array.freeze<Int>(acc_thawed);
    };
}