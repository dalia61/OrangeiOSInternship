import Foundation

protocol ListView {
    func NumOfFollowers(Items:[String] )-> Int
    func NameOfFollowers(Items:[String])
    func What ()
}

extension ListView{
    func What(){
        print("Your Followers")
    }
}

class Followers:ListView{
    
    func NumOfFollowers(Items:[String]) -> Int {
        return Items.count
    }
    func NameOfFollowers(Items: [String]) {
        for item in Items {
            print(item)
        }
    }
    init() {
        print("Start")
    }
}

class Fans:ListView{
    func NumOfFollowers(Items:[String]) -> Int {
        return Items.count
    }
    func NameOfFollowers(Items: [String]) {
        for item in Items {
            print(item)
        }
    }
}

var view:ListView = Followers()
view.What()
view.NameOfFollowers(Items:["Dalia","Rania","Yara"])

var fan:ListView = Fans()
fan.What()
fan.NameOfFollowers(Items: ["A","B","C","D"])
 view = fan





