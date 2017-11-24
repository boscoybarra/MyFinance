//
//  ViewController.swift
//  MyFinance
//
//  Created by J B on 11/5/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    // MARK: Properties
    
    var timer = Timer()
    var workoutDuration: [String]!
    
    // MARK: Outlets
    
    @IBOutlet weak var bitcoinValueLabel: UILabel!
    @IBOutlet weak var bitcoinCashValueLabel: UILabel!
    @IBOutlet weak var etherValueLabel: UILabel!
    
    @IBOutlet weak var barChartView: BarChartView!
    
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.getCrypto), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCrypto()
        populateChartData()
        scheduledTimerWithTimeInterval()
        
    }
    
    @objc fileprivate func getCrypto() {
        MYFClient.getCrypto(completionHandler: createCryptoPricesFromURLs)
    }
    
    
    func createCryptoPricesFromURLs(urls: [Float]?, error: Error?) {
        let bitCoin = MYFClient.formatAsCurrencyString(value: urls![0] as NSNumber)
        let bitCoinCash = MYFClient.formatAsCurrencyString(value: urls![1] as NSNumber)
        let etherCoin = MYFClient.formatAsCurrencyString(value: urls![2] as NSNumber)
        
        DispatchQueue.main.async {
        self.bitcoinValueLabel.text = bitCoin
        self.bitcoinCashValueLabel.text = bitCoinCash
        self.etherValueLabel.text = etherCoin
        }
    }
    
    // Populate data
    func populateChartData() {
        workoutDuration = ["1","2","3","4","5","6","7","8","9","10"]
        let beatsPerMinute = [76.0, 150.0, 160.0, 180.0, 195.0, 195.0, 180.0, 164.0, 136.0, 112.0]
        self.getChartData(dataPoints: workoutDuration, values: beatsPerMinute)
    }
    
    // Conform to protocol
    func getChartData(dataPoints: [String], values: [Double]) {
        
        barChartView.noDataText = "You need to provide data for the chart"
        
        var dataEntries: [BarChartDataEntry] = []
        var counter = 0.0
        
        for i in 0..<dataPoints.count {
            counter += 1.0
            let dataEntry = BarChartDataEntry(x: values[i], y: counter)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Time")
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        barChartView.data = chartData
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }
    
}

