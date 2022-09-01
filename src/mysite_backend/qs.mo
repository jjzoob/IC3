import Array "mo:base/Array";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";

// quicksort函数
func quicksort(arr : [var Int]) : () {
    if(arr.size() == 0){
        return;
    };
    var res = [arr[0]];
    res := Array.append<Int>(res, Array.freeze<Int>(arr));
    var temp : [var Int] = Array.thaw<Int>(res);
    _sort(temp, 1, Iter.size<Int>(Array.vals<Int>(Array.freeze<Int>(arr))));
    for(i in Iter.range(1, Iter.size<Int>(Array.vals<Int>(Array.freeze<Int>(arr))))){
        arr[i-1] := temp[i];
    };
};

func _sort(s : [var Int], start : Nat, end : Nat) : (){
    var i = start;
    var j = end;
    s[0] := s[start];
    while(i < j){
        while(i < j and s[0] < s[j]){
            j := j - 1;
        };
        if(i < j){
            s[i] := s[j];
            i := i + 1;
        };
        while(i < j and s[i] <= s[0]){
            i := i + 1;
        };
        if(i < j){
            s[j] := s[i];
            j := j - 1;
        };
    };
    s[i] := s[0];
    if(start < i){
        _sort(s, start, j - 1);
    };
    if(i < end){
        _sort(s, j + 1, end);
    };
};

// Do some tests
//方便测试
func qsort(array : [Int]) : [Int]{
    let res : [var Int] = Array.thaw(array);
    quicksort(res);
    Array.freeze<Int>(res);
};
// $ moc -r --package base $(dfx cache show)/base qs.mo
Debug.print("快排函数测试：") ;
var Sample0 = [];
var Sample1 = [8];
var Sample2 = [8,-23];
var Sample5 = [8,-23,10,0,3];
var SampleN = [8,-23,10,0,3,10,0,-10,-23,1_000_000,-9_000];

Debug.print(debug_show(Sample0) # "--->" # debug_show(qsort(Sample0)));
Debug.print(debug_show(Sample1) # "--->" # debug_show(qsort(Sample1)));
Debug.print(debug_show(Sample2) # "--->" # debug_show(qsort(Sample2)));
Debug.print(debug_show(Sample5) # "--->" # debug_show(qsort(Sample5)));
Debug.print(debug_show(SampleN) # "--->" # debug_show(qsort(SampleN)));

