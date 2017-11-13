//
//  MYFConvinience.swift
//  MyFinance
//
//  Created by J B on 11/7/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import Foundation

extension MYFClient {
    
    //MARK: -- Function GETs the values from Crypto
    
    static func getCrypto(completionHandler: @escaping cryptoURLsResponse) {
        
    //https://min-api.cryptocompare.com/data/pricemulti?fsyms=BCH,BTC,ETH&tsyms=USD,EUR
        
        let selectedCurrencies = "BTC,BCH,ETH"
        
        let methodParameters = [
            Constants.CryptoParameterKeys.cryptoType: selectedCurrencies,
            Constants.CryptoParameterKeys.currencyType: Constants.CryptoParameterValues.currencyEUR
            ] as [String : Any]
        
        print("hello pams", methodParameters)
        
        MYFClient.makeValueGETRequest(methodParameters: methodParameters as [String:AnyObject]) { (data: AnyObject?, error: NSError?) in
            func sendError(_ error: String) {
                _ = [NSLocalizedDescriptionKey : error]
                
            }
            
            guard (error == nil) else {
                sendError("There was an error with your request: \(error.debugDescription)")
                return
            }
            
            guard let cryptoinBTC = data![Constants.CryptoParameterValues.currencyBTC] as? [String:AnyObject] else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let cryptoinBCH = data![Constants.CryptoParameterValues.currencyBCH] as? [String:AnyObject] else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let cryptoinETH = data![Constants.CryptoParameterValues.currencyETH] as? [String:AnyObject] else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            
            guard let cryptoInEuro = cryptoinBTC[Constants.CryptoParameterValues.currencyEUR] as? Float else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            print("cryptoInEuro", cryptoInEuro)
            
            completionHandler(cryptoInEuro, nil)
            
            
//            let cryptoDictionary = EURStrings
//
//            // We check if value is empty in Euro
//            if cryptoInEUR != "" {
//
//                completionHandler(cryptoDictionary, nil)
//                print("hello eur", EURStrings)
//
//            } else {
//                print("No data from Cryto at this place")
//                completionHandler("", nil)
//            }
        }
        
        
    }
    
    
    
}
