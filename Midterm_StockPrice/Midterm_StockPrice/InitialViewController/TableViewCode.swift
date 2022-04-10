//
//  TableViewCode.swift
//  Midterm_StockPrice
//


import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        guard let rows = stockModel?.count else { return 0 }
        
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockMarketTableViewCell", owner: self, options: nil)?.first as! StockMarketTableViewCell
        guard let stocks = stockModel?[indexPath.row] else {return cell}
        
        cell.lblName.text = stocks.companyname
        cell.lblCSymbol.text = stocks.symbol
        cell.companyName = stocks.companyname
        cell.companySymbol = stocks.symbol
        cell.sendStockDelegate = self
                            
        return cell
    }
    
    
}
