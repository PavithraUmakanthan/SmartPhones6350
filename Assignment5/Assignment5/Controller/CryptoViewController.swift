//
//  CryptoViewController.swift
//  Assignment5
//
//  Created by Venkatanathan Annamalai on 3/2/22.
//
import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class CryptoViewController: UIViewController {

    @IBOutlet weak var txtCryptoSymbol: UITextField!
    @IBOutlet weak var lblCryptoPrice: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getCryptoPrice(_ sender: Any) {
   
        guard let symbol = txtCryptoSymbol.text else {return }
        
        let url = "\(cryptoQuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"

        
        print(url)
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)

            if response.error != nil{
                print(response.error!)
                return
            }
            //if I am here then I have got the data
            
            let cryptos = JSON(response.data!).array
            
            guard let crypto = cryptos!.first else {
                return
            }

        
            print(crypto)
            
            let quote = QuoteCrypto()
            quote.symbol = crypto["symbol"].stringValue
            quote.price = crypto["price"].floatValue
            quote.volume = crypto["volume"].intValue
            
            self.lblCryptoPrice.text = "\(quote.symbol) :\(quote.price) $"
            
        }
    }
    
    
}
