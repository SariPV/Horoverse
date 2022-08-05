//
//  ChineseViewModel.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 9/3/2565 BE.
//

import UIKit
import AlamofireImage


class ChineseViewModel: UIViewController {
    @IBOutlet weak var animalImage:UIImageView!
    @IBOutlet weak var animalName:UILabel!
    @IBOutlet weak var animalDetail:UITextView!
    
    var names = ""
    var images = ""
    var details = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let url = URL(string: images) {
            self.animalImage.af.setImage(withURL: url, cacheKey: images, completion: nil)
        animalName.text = names
        animalDetail.text = details
        }
        
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
