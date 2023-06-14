import UIKit
import Foundation

struct Area{
    private var length:Double
    private var width:Double
    init (length:Double,width:Double){
        self .length = length
        self .width = width
    }
    func cal()->Double{
        var calarea = length * width
        return calarea
    }
    mutating func reset(){
        length = 0
    }
}
class Area1{
    private var length:Double
    private var width:Double
    init (length:Double,width:Double){
        self .length = length
        self .width = width
    }
    func reset(){
        length = 0
    }
}
struct Width{
    private var length:Double
    private var area:Area
    init (length:Double,area:Area){
        self .length = length
        self .area = area
    }
}
let area = Area(length: 2.5, width: 3.5)
let width = Width(length: 2.5, area: area)


