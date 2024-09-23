import Cocoa

func reverse(sentence: String) -> String {
    var reversed = ""
    for i in sentence {
        reversed = String(i) + reversed
    }
    return reversed
}

print(reverse(sentence: "Hello World"))
