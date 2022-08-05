//
//  BirthDateViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 10/3/2565 BE.
//

import UIKit
import FirebaseFirestore
class BirthDateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    var date = Date()
    var result = 0
    let formatter = DateFormatter()
    var birthdate: [birthdateResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Numerlogy Horoscope"
        
      
        navigationController?.navigationBar.tintColor = UIColor(red: 0.125, green: 0.071, blue: 0.302, alpha: 1)
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.purple]
      

     
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
//        datePicker.backgroundColor = UIColor.white
//        let formatter = DateFormatter()
        

       
        formatter.dateFormat = "yyyy-mm-dd"
        // Do any additional setup after loading the view.
      //  let dateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: self.datePicker.date)
        formatter.dateFormat = "MM"
        let month: String = formatter.string(from: self.datePicker.date)
        formatter.dateFormat = "dd"
        let day: String = formatter.string(from: self.datePicker.date)
        
        let Syear = Int(year) ?? 0
        let Smonth = Int(month) ?? 0
        let Sday = Int(day) ?? 0
        
        let sums = Syear + Smonth + Sday
        print(sums)
        
        var sum:Int = 0

        func SumOfDigits(number:Int)->Int {
            if number > 0 {
                sum += (number % 10)
                return SumOfDigits(number:number / 10)
            }

            return sum
        }

        result = SumOfDigits(number:sums)
        print(result)
//        let year: Int = datePicker.calendar.
//      //  let month: Int = datePicker.month
//   
//        let day: Int = dateFormatter.string(from: self.datePicker.date))
    }
    override func viewWillAppear(_ animated: Bool) {
        let db = Firestore.firestore().collection("Category").document("Birthdate").collection("detail")
            db.getDocuments(completion: { querySnapshot, err in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       print("\(document.documentID) => \(document.data())")
                   }
                   
                   if let querySnapshot = querySnapshot {
                       self.birthdate = querySnapshot.documents.map({ item in
                           return birthdateResponse(number: item["number"] as? Int ?? 0,
                                                    description: item["detail"] as? String ?? ""                   )
                       })
                   }
                  // self.reloadData()
                  
               }
               })
       }
    @IBAction func datePickerChanged(_ sender: Any) {
//        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: self.datePicker.date)
        formatter.dateFormat = "MM"
        let month: String = formatter.string(from: self.datePicker.date)
        formatter.dateFormat = "dd"
        let day: String = formatter.string(from: self.datePicker.date)
        let Syear = Int(year) ?? 0
        let Smonth = Int(month) ?? 0
        let Sday = Int(day) ?? 0
        
        let sums = Syear + Smonth + Sday
        print(sums)
        
        var sum:Int = 0

        func SumOfDigits(number:Int)->Int {
            if number > 0 {
                sum += (number % 10)
                return SumOfDigits(number:number / 10)
            }

            return sum
        }
        
         result = SumOfDigits(number:sums)
        print(result)
    }
//    var result = SumOfDigits(number:sums)
    @IBAction func viewProphecyClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "birthDateDetailScene") as?
        
            BirthDateDetailViewController{
            formatter.dateFormat = "dd-MMMM-yyyy"
            vc.dates = formatter.string(from:datePicker.date)
            let count = birthdate.count
            for i in 0..<count{
                if result == birthdate[i].number{
                    vc.numbers = birthdate[i].number
                    vc.details = birthdate[i].description
                }
            }
      //      let str = String(result)
//            vc.numbers = result
            
            present(vc, animated: true, completion: nil)
            
        }else{
            
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
