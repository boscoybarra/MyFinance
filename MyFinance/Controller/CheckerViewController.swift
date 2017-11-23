//
//  CheckerViewController.swift
//  MyFinance
//
//  Created by J B on 11/21/17.
//  Copyright © 2017 Bosco Ybarra. All rights reserved.
//

import UIKit
import Charts

class CheckerViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    // Chart data
    var workoutDuration: [String]!
    //var beatsPerMinute = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate chart data
        populateChartData()
        
        // Bar chart
        //barChart()
        
        //Line chartBar
        //lineChart()
        
        // Cubic line chart
        //cubicChart()
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
    

