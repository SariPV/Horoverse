//
//  ViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 25/2/2565 BE.
//

import UIKit


class ViewController: UIViewController {
//    var catList = [List(image: "Calendar", name: "Birth Date"),List(image: "SunDim", name: "Daily Horoscopes"),List(image: "tarot", name: "Tarot")
//    ]
//    var catList = [ "Birth Date", "Daily Horoscopes", "Tarot"]
//    var images = ["Calendar","SunDim", "tarot"]

    var category: [categoryResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.view.backgroundColor = .clear
//        navigationItem.setHidesBackButton(true, animated: true)
    }

    

    @IBAction func getStartedClick(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "categoryScene") as?
        
            CategoryViewController{
            
            navigationController?.pushViewController(vc, animated: true)
            
        }else{
            navigationItem.setHidesBackButton(true, animated: true)
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}


