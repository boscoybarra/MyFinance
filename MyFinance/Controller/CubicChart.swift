////
////  CubicChart.swift
////  MyFinance
////
////  Created by J B on 11/17/17.
////  Copyright © 2017 Bosco Ybarra. All rights reserved.
////
//
//import UIKit
//import Charts
//
//class CubicChart: UIView {
//    
//    // Chart Color
//    let electricGreen = UIColor(hue: 0.3361, saturation: 1, brightness: 1, alpha: 1.0)
//    
//    // Cubic line graph properties
//    let lineChartView = LineChartView()
//    var lineDataEntry: [ChartDataEntry] = []
//    
//    // Chart data
//    var workoutDuration = [String]()
//    var beatsPerMinute = [String]()
//    
//    var delegate: GetChartData! {
//        didSet {
//            populateData()
//            cublicLineChartSetup()
//        }
//    }
//    
//    func populateData() {
//        workoutDuration = delegate.workoutDuration
//        beatsPerMinute = delegate.beatsPerMinute
//    }
//    
//    func lineChartSetup() {
//        
//        // Line chart config
//        self.backgroundColor = UIColor.white
//        self.addSubview(lineChartView)
//        lineChartView.translatesAutoresizingMaskIntoConstraints = false
//        if #available(iOS 9.0, *) {
//            lineChartView.topAnchor.constraint(equalTo: self.topAnchor, constant:20).isActive = true
//            lineChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//            lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            lineChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        } else {
//            // Fallback on earlier versions
//        }
//     
//        // Line chart animation
//        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
//        
//        // Line chart population
//        setCublicLineChart(dataPoints: workoutDuration, values: beatsPerMinute)
//    }
//    
//    func cublicLineChartSetup() {
//        
//        // Line chart config
//        self.backgroundColor = UIColor.white
//        self.addSubview(lineChartView)
//        lineChartView.translatesAutoresizingMaskIntoConstraints = false
//        if #available(iOS 9.0, *) {
//            lineChartView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            lineChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        } else {
//            // Fallback on earlier versions
//        }
//        
//        
//        // Line chart animation
//        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInSine)
//        
//        // Line chart population
//        setCublicLineChart(dataPoints: workoutDuration, values: beatsPerMinute)
//    }
//    
//    func setCublicLineChart(dataPoints: [String], values: [String]) {
//        
//        // No data setup
//        lineChartView.noDataTextColor = UIColor.white
//        lineChartView.noDataText = "No data for the chart."
//        lineChartView.backgroundColor = UIColor.white
//        
//        // Dara point setup & color config
//        for i in 0..<dataPoints.count {
//            let dataPoint = ChartDataEntry(x: Double(i), y: Double(values[i])!)
//            lineDataEntry.append(dataPoint)
//        }
//        
//        let chartDataSet = LineChartDataSet(values: lineDataEntry, label: "BPM")
//        let chartData = LineChartData()
//        chartData.addDataSet(chartDataSet)
//        chartData.setDrawValues(true) // set to false if you don't want values above bar
//        chartDataSet.colors = [electricGreen]
//        chartDataSet.setCircleColor(electricGreen)
//        chartDataSet.circleHoleColor = electricGreen
//        chartDataSet.circleRadius = 4.0
//        chartDataSet.mode = .cubicBezier
//        chartDataSet.cubicIntensity = 0.2
//        chartDataSet.drawCirclesEnabled = false
//        
//        chartDataSet.valueFont = UIFont(name: "Helvetica", size: 12.0)!
//        
//        // Gradient Fill
//        let gradientColors = [electricGreen.cgColor, UIColor.clear.cgColor] as CFArray
//        let colorLocations: [CGFloat] = [1.0, 0.0] // positioning of gradient
//        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) else { print("gradient error"); return }
//        chartDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
//        chartDataSet.drawFilledEnabled = true
//        
//        // Axes setup
//        let formatter: ChartFormatter = ChartFormatter()
//        formatter.setValues(values: dataPoints)
//        let xaxis:XAxis = XAxis()
//        xaxis.valueFormatter = formatter
//        lineChartView.xAxis.labelPosition = .bottom
//        lineChartView.xAxis.drawGridLinesEnabled = false // true if you want X-Axis grid lines
//        lineChartView.xAxis.valueFormatter = xaxis.valueFormatter
//        lineChartView.chartDescription?.enabled = false
//        lineChartView.legend.enabled = true
//        lineChartView.rightAxis.enabled = false
//        lineChartView.leftAxis.drawGridLinesEnabled = false // true is you want Y-axis grid lines
//        lineChartView.leftAxis.drawLabelsEnabled = true
//        lineChartView.data = chartData
//        
//    }
// 
//    
//    //END OF CLASS
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
