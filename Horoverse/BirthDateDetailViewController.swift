//
//  BirthDateDetailViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 11/3/2565 BE.
//

import UIKit

class BirthDateDetailViewController: UIViewController {
    @IBOutlet weak var date:UILabel!
    @IBOutlet weak var number:UILabel!
    @IBOutlet weak var detail:UITextView!

//    var birthdate: [birthdateResponse] = []
    var dates = ""
    var numbers = 0
    var details = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        date.text = dates
        number.text = String(numbers)
        detail.text = details
        // Do any additional setup after loading the view.
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
