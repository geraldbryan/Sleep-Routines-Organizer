//
//  SleepRecordViewController.swift
//  SleepOrganizer
//
//  Created by Gerald Bryan on 28/04/22.
//

import UIKit

var sleepData = [sleep]()

class SleepRecordViewController: UIViewController {
    
    @IBOutlet weak var sleepRecord: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleepRecord.delegate = self
        sleepRecord.dataSource = self
        
        initData()

        // Do any additional setup after loading the view.
    }
    
    func initData() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"

        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: timeFormatter.string(from: Date()), wakeupHour: timeFormatter.string(from: Date()), sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
//        sleepData.append(sleep(day: formatter.string(from: Date()), sleepHour: "21:00", wakeupHour: "08:00", sleepDuration: "11 Hours"))
        
     
     // trigger refresh collection view
     sleepRecord.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SleepRecordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: Menentukan jumlah item yang akan di tampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK: Menghitung jumlah item array dataEmojies
        var hitung: Int?
        
        if sleepData.count < 10{
            hitung = sleepData.count
        } else {
            hitung = 10
        }
        return hitung!
    }
    
    // MARK: mengatur view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "viewCellSleepRecord", for: indexPath) as! SleepRecordCollectionViewCell

        // set nilai ke view dalam cell
        let sleep = sleepData[indexPath.row]
        cell.day.text = sleep.day!
        cell.sleepHour.text = sleep.sleepHour!
        cell.wakeUpHour.text = sleep.wakeupHour!
        cell.sleepDuration.text = sleep.sleepDuration!

        return cell
    }

    // MARK: mengatur layout view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Lebar & tinggil cell
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}

