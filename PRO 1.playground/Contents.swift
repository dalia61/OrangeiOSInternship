import UIKit

let Message = {
    print("Car Brands")
}

protocol CarBrands{
    func GetType( )->String
    func GetModel( )
    func GetPrice( )
    func Start()
}

extension CarBrands{
    func Start(){
        print("Car Info: ")
    }
}

let Message1 = { (car: String) in
    print("choose: \(car) ")
}

class ChangeType{
    var CarT:CarBrands = BMW()
    func Run(){
        CarT = Ferrari()
    }
}

class BMW:CarBrands{
    func GetType()->String {
        return "BMW"
    }
    func GetModel()  {
        return print("2022")
    }
    func GetPrice()  {
        return print(1000000)
    }
}

class Ferrari:CarBrands{
    func GetType() -> String {
        return "Ferrari";
    }
    func GetModel()  {
        return print("2023")
    }
    func GetPrice() {
        return print(2000000)
    }
}

Message()

var delegate:CarBrands?

let Car1 = BMW()
Message1(Car1.GetType())
Car1.Start()
Car1.GetType()
Car1.GetModel()
Car1.GetPrice()

let Car2 = Ferrari()
Message1(Car2.GetType())
Car2.Start()
Car2.GetType()
Car2.GetModel()
Car2.GetPrice()
