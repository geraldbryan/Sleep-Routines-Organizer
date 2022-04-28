//
//  ViewController.swift
//  SleepOrganizer
//
//  Created by Gerald Bryan on 27/04/22.
//

import UIKit

func getAvgTime(results: Array<Date>) -> String {
    var totalHours = 0.0
    var totalMinutes = 0.0
    var avgTime = ""

    // sum all hours & minutes together
    for result in results {
        let hours = Double(Calendar.current.component(.hour, from: result))
        let minutes = Double(Calendar.current.component(.minute, from: result))
        
        totalHours = totalHours + hours
        totalMinutes = totalMinutes + minutes
    }
    
    // calculate avg hours
    let avgHourH : Int = Int(round(totalHours / Double(results.count)))
    
    // calculate avg minutes based on decimals
    let avgHourM : Int = Int(round(totalMinutes / Double(results.count)))
    
    // formating output hh:mm:00
    avgTime = String(format:"%02d:%02d", avgHourH, avgHourM)

    return avgTime
}

class ViewController: UIViewController {
    
    @IBOutlet weak var recordSleep: UIButton!
    @IBOutlet weak var sleepRecommendation: UIButton!
    
    @IBOutlet weak var startHour: UILabel!
    @IBOutlet weak var finishHour: UILabel!
    
    
    override func viewDidLoad() {
        // example usage
        
        sleepData
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"

        var arrayOfDates : Array<Date> = []
        
        var date1 = formatter.date(from: "2015-08-26 10:30:00")
        var date2 = formatter.date(from: "2015-08-26 9:00:00")
        var date3 = formatter.date(from: "2015-08-26 11:30:00")
        var date4 = formatter.date(from: "2015-08-26 11:15:00")
        var date5 = formatter.date(from: "2015-08-26 9:15:00")
        
        arrayOfDates.append(date1!)
        
        arrayOfDates.append(date2!)
        
        arrayOfDates.append(date3!)
        
        arrayOfDates.append(date4!)
        
        arrayOfDates.append(date5!)
        

        let avgTime = getAvgTime(results: arrayOfDates) // = 10:18:00
        
        startHour.text = avgTime
        
        finishHour = sleepData[0].sleepHour
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

