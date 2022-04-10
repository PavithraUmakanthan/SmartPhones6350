//
//  NetworkFunctions.swift
//  Midterm_StockPrice
//


import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON


func getCurrentStockURL(_ symbol : String ) -> String {
    let url = "\(urlShortQuote)\(symbol)?apikey=\(apiKey)"
    return url
}


func getCurrentStockData(_ url : String) -> Promise<QuoteShort>{
    return Promise<QuoteShort> { seal -> Void in
        AF.request(url).responseJSON{ response in
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let currentStockModel = QuoteShort("","")
            
            

            let currentStockArray = JSON(response.data!).arrayValue
            guard let currentStock = currentStockArray.first else {return seal.fulfill(currentStockModel)}
            
            currentStockModel.companyname = currentStock["name"].stringValue
            currentStockModel.symbol = currentStock["symbol"].stringValue
            currentStockModel.price = currentStock["price"].floatValue
            currentStockModel.dayhigh = currentStock["dayHigh"].floatValue
            currentStockModel.daylow = currentStock["dayLow"].floatValue
            print("Print the Current Stock Value")
            print(currentStockModel)
            seal.fulfill(currentStockModel)
        }
    }
}
