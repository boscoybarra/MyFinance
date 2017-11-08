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
        
        
        let methodParameters = [
            Constants.CryptoParameterKeys.cryptoType: Constants.CryptoParameterValues.currencyBCH,
            Constants.CryptoParameterKeys.currencyType: Constants.CryptoParameterValues.currencyEUR
        ]
        
        MYFClient.makeValueGETRequest(methodParameters: methodParameters as [String:AnyObject]) { (data: AnyObject?, error: NSError?) in
            func sendError(_ error: String) {
                _ = [NSLocalizedDescriptionKey : error]
                
            }
            
            guard (error == nil) else {
                sendError("There was an error with your request: \(error.debugDescription)")
                return
            }
            
            guard let cryptoDictionary = data![Constants.CryptoResponseKeys.Simple] as? String else {
                sendError("Crypto dictionary could not be printed in \(String(describing: data))")
                return
            }
            
            guard let EURStrings = data![Constants.CryptoResponseKeys.EUR] as? String else {
                sendError("Crypto dictionary could not be printed in \(String(describing: cryptoDictionary))")
                return
            }
            
            let cryptoInEUR = EURStrings
            
            // We check if value is empty in Euro
            if cryptoInEUR != "" {
                
                completionHandler(cryptoDictionary, nil)
                
            } else {
                print("No data from Cryto at this place")
                completionHandler("", nil)
            }
        }
        
        
    }
    
}
