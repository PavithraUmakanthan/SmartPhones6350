//
//  StockDetails.swift
//  Midterm_StockPrice
//


import Foundation

class QuoteShort{
    
    init(_ companyName : String, _ symbol : String){
        self.companyname = companyName
        self.symbol = symbol
    }
    var companyname : String = ""
    var symbol : String = ""
    var price : Float = 0.0
    var dayhigh : Float = 0.0
    var daylow : Float = 0.0
    
}
