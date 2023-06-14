import UIKit
import Foundation

//build models for these entities (Employee, Company, Visa) with available properties and objects






enum CardType{
    case visa
    case masterCard
}

class Employee{
    private var name:String
    private var birthDate:String
    private var ID:String
    private var city:String
    private var nationality:String
    private var company:Company
    private var salary:Double
     var creditCard:CreditCard?
    //initializer
    init(name:String, birthDate:String, ID:String , city:String, nationality:String ,
         company:Company , salary:Double , creditCard:CreditCard?){
        self.name = name
        self.birthDate = birthDate
        self.ID = ID
        self.city = city
        self.nationality = nationality
        self.company = company
        self.salary = salary
        self.creditCard = creditCard
    }
    deinit{
        print("Deinit")
        name = " "
        ID = " "
    }
}

class Company{
    private var taxID:String
    private var address:String
    private var phone:String
    init(taxID:String , address:String , phone:String){
        self.taxID = taxID
        self.address = address
        self.phone = phone
    }
    deinit{
        print("Deinit company")
        taxID = " "
        address = " "
    }
}

class CreditCard{
   var employee:Employee
    private var bankName:String
    private var cardNumber:String
    private var expiryDate:String
    private var cardType:CardType
    init(bankName:String , cardNumber:String ,expiryDate:String , cardType:CardType , employee:Employee){
        self.bankName = bankName
        self.cardNumber = cardNumber
        self.expiryDate = expiryDate
        self.cardType = cardType
        self.employee = employee
    }
    deinit{
        print("Deinit credit")
        bankName = " "
        cardNumber = " "
        expiryDate =  " "
        
    }
}
let company = Company(taxID: "12334", address: "xxx/dd/vvv", phone: "029876")
var employee:Employee? = Employee(name: "DALIA", birthDate: "15/6/2001", ID: "202006376", city: " of october", nationality: "Egyption", company: company, salary: 2098, creditCard: credit)




var credit:CreditCard? = CreditCard(bankName: "ABC", cardNumber: "098776543212345", expiryDate: "1/25", cardType: .visa,employee: employee)

credit = nil

