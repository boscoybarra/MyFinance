//
//  MYFClient.swift
//  MyFinance
//
//  Created by J B on 11/7/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class MYFClient: NSObject {

    static var session = URLSession.shared
    
    // MARK: GET Data With URLs
    
    @objc static func makeValueGETRequest(methodParameters: [String:AnyObject], completionHandler: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        let url = self.cryptoURLFromParameters(methodParameters)
        
        let request = NSMutableURLRequest(url: url)
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
                return
            }
            
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            self.parseJSONWithCompletionHandler(data: data as NSData, completionHandler: completionHandler)
            
        }
        
        task.resume()
        return task
    }
    
    // MARK: GET Data With URLs
    
    @discardableResult static func taskForGETDataMethod(url urlString: String, completionHandler: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask{
        
        
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandler(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
                return
            }
            
            guard (error == nil) else {
                sendError("There was an error with your request: \(error!)")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            completionHandler(data as AnyObject, nil)
            
        }
        
        task.resume()
        return task
        
    }
    
 
    // MARK: Helper Methods
    
    private static func parseJSONWithCompletionHandler(data: NSData, completionHandler: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        var parsedResult: AnyObject!
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as AnyObject
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandler(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
            return
        }
        
        completionHandler(parsedResult, nil)
        
    }
    
    private static func cryptoURLFromParameters(_ parameters: [String:AnyObject]) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.Crypto.APIScheme
        components.host = Constants.Crypto.APIHost
        components.path = Constants.Crypto.APIPath
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
    }
    
    static func cryptoValuesToCheck() -> String {
        
        let BTC = Constants.CryptoParameterValues.currencyBTC
        let BCH = Constants.CryptoParameterValues.currencyBCH
        let ETH = Constants.CryptoParameterValues.currencyETH
        
        return "\(BTC),\(BCH),\(ETH)"
    
    }
    
    static func formatAsCurrencyString(value: NSNumber?) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_EU")
        formatter.numberStyle = .currency
        
        guard let value = value,
            let formattedCurrencyAmount = formatter.string(from: value) else {
                return nil
        }
        return formattedCurrencyAmount
    }
    
}
