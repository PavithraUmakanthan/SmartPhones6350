//
//  ViewController.swift
//  Midterm_StockPrice
//
//

import UIKit

class ViewController: UIViewController, SendStockDelegate {

    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
   let stockCompArray = ["APPL","MSFT","AMZN","GOOG","FB"]
    
    var stockModel: [QuoteShort]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockModel = initializeCompanyNames()
        lblCompanyName.text = "Apple Inc."
        lblPrice.text = "Price: 170.09"
        lblSymbol.text = "AAPL"
        lblDayHigh.text = "High: 171.77"
        lblDayLow.text = "Low: 169.02"

        // Do any additional setup after loading the view.
    }
    func initializeCompanyNames() -> [QuoteShort]{
        let facebook = QuoteShort("Meta Platforms, Inc.", "FB");
        let apple = QuoteShort("Apple Inc", "AAPL");
        let microsoft = QuoteShort("Microsoft Corporation", "MSFT");
        let amazon = QuoteShort("Amazon.com, Inc.", "AMZN");
        let google = QuoteShort("Alphabet Inc.", "GOOG");
        
        

        var modelArr = [QuoteShort]()
        
        modelArr.append(apple)
        modelArr.append(microsoft)
        modelArr.append(amazon)
        modelArr.append(google)
        modelArr.append(facebook)

        return modelArr
    }
    
    func sendStockData(_ quoteShort: QuoteShort) {
        
        lblCompanyName.text = quoteShort.companyname
        lblSymbol.text = quoteShort.symbol
        lblPrice.text = "Price: \(quoteShort.price)"
        lblDayHigh.text = "High: \(quoteShort.dayhigh)"
        lblDayLow.text = "Low: \(quoteShort.daylow)"
        
        print(quoteShort.companyname)
    }
    
    @IBAction func addMoreNames(_ sender: Any) {
        
        var txtField : UITextField?
                
                let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
                
                let OKButton = UIAlertAction(title: "OK", style: .default) { action in
                    guard let symbol = txtField?.text else {
                        return
                    }
                            
//                    self.addStockToDB(symbol: symbol)
                }
                
                let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
                    
                }
                
                alertController.addAction(OKButton)
                alertController.addAction(cancelButton)
                
                alertController.addTextField { stockTextField in
                    stockTextField.placeholder = "Type Stock Symbol"
                    txtField = stockTextField
                    
                }
                
                self.present(alertController, animated: true, completion: nil)
        
    }

    

}
