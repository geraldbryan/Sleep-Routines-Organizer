//
//  AddRecordViewController.swift
//  SleepOrganizer
//
//  Created by Gerald Bryan on 28/04/22.
//

import UIKit

class AddRecordViewController: UIViewController {
    
    @IBOutlet weak var tanggal: UIDatePicker!
    @IBOutlet weak var tes: UILabel!
    @IBOutlet weak var waktuTidur: UILabel!
    @IBOutlet weak var waktuBangun: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        tes.text = formatter.string(from: Date())
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func datePickerChanged(sender: UIDatePicker) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        tes.text = somedateString

    }
    
    @IBAction func sleepTimePicker(sender: UIDatePicker) {

        let sleepFormatter = DateFormatter()
        sleepFormatter.dateFormat = "HH:mm"
        sender.datePickerMode = UIDatePicker.Mode.time
        let nightTime = sleepFormatter.string(from: sender.date)
        waktuTidur.text = nightTime

    }
    
    @IBAction func wakeupTimePicker(sender: UIDatePicker) {

        let wakeFormatter = DateFormatter()
        wakeFormatter.dateFormat = "HH:mm"
        let morningTime = wakeFormatter.string(from: sender.date)
        waktuBangun.text = morningTime

    }
    
    @IBAction func saveButton(_ sender:UIDatePicker){
        
        sleepData.insert(sleep(day: tes.text, sleepHour: waktuTidur.text, wakeupHour: waktuBangun.text, sleepDuration: "8 Hours"), at: 0)
        
        performSegue(withIdentifier: "saveData", sender: self)
        
    }

}


