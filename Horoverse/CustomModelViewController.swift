//
//  CustomModelViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 6/3/2565 BE.
//

import UIKit


class CustomModelViewController: UIViewController {
    @IBOutlet var image:UIImageView!
    @IBOutlet var name:UILabel!
    @IBOutlet var detail:UITextView!
    
    var names = ""
    var images = ""
    var details = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: images) {
            self.image.af.setImage(withURL: url, cacheKey: images, completion: nil)
        name.text = names
        detail.text = details
        }
//        name.text = names
//        image.image = UIImage(named: images)
//        detail.text = details
   
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
