//
//  NetworkController.swift
//  Midterm_StockPrice
//


import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

extension ViewController{
   
    
    func getStockData(_ symbol : String) -> Promise<QuoteShort>{
        return Promise<QuoteShort>{ seal -> Void in
            let url = urlShortQuote + symbol + "?apikey=" + apiKey
            
            print(url)
            sleep(1)
            
            AF.request(url).responseJSON{ response in
                if response.error != nil {
                    seal.reject(response.error!)
                    return
                }
                let stocks = JSON(response.data!).array
                
                let quote = QuoteShort("","")
                
                if stocks == nil{
                    seal.fulfill(quote)
                    return
                }
                guard let firstStock = stocks!.first else {
                    seal.fulfill(quote)
                    return
                }
                
                quote.companyname = firstStock["name"].stringValue
                quote.price = firstStock["price"].floatValue
                quote.dayhigh = firstStock["dayHigh"].floatValue
                quote.daylow = firstStock["dayLow"].floatValue
                quote.symbol = firstStock["symbol"].stringValue
                seal.fulfill(quote)
                
            }
        }
    }
}
