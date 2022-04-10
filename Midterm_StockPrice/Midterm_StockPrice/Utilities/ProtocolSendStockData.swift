//
//  ProtocolSendStockData.swift
//  Midterm_StockPrice
//


import Foundation

protocol SendStockDelegate {
    func sendStockData(_ quoteShort : QuoteShort)
}
