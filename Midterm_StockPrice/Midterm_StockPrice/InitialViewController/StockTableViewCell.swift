//
//  StockTableViewCell.swift
//  Midterm_StockPrice
//

import UIKit

class StockMarketTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCSymbol: UILabel!
    
    var companyName = ""
    var companySymbol = ""
    
    var sendStockDelegate : SendStockDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBAction func getPriceAction(_ sender: Any) {
        let currentURL = getCurrentStockURL(companySymbol)
                
        getCurrentStockData(currentURL).done { currentStockModel in
            self.sendStockDelegate?.sendStockData(currentStockModel)
            print(currentStockModel)
            
        }
        .catch { error in
                    print(error.localizedDescription)
                }
    }
    
}



