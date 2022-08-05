//
//  CategoryViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 4/3/2565 BE.
//

import UIKit
import FirebaseFirestore

class CategoryViewController: UIViewController {
    @IBOutlet weak var contentTableView: UITableView!
    var category: [categoryResponse] = []
    var viewPage = ["birthdateScene","Chinese","collection"]
//    var catList = [ "Birth Date", "Daily Horoscopes", "Tarot","Chinese Horoscope"]
//    var images = ["Calendar","SunDim", "tarot","YinYang"]
//    @IBOutlet
//    weak var containerView: UIView! {
//        didSet {
//            containerView.backgroundColor = UIColor.clear
//            containerView.layer.shadowOpacity = 1
//            containerView.layer.shadowRadius = 2
//            containerView.layer.shadowColor = UIColor(named: "Orange")?.cgColor
//            containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        }
//    }
//    @IBOutlet
//    weak var clippingView: UIView! {
//        didSet {
//            clippingView.layer.cornerRadius = 10
//            clippingView.backgroundColor = UIColor(named: "Red")
//            clippingView.layer.masksToBounds = true
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationItem.setHidesBackButton(true, animated: true)
           let db = Firestore.firestore()
           db.collection("Category").getDocuments(completion: { querySnapshot, err in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       print("\(document.documentID) => \(document.data())")
                   }
                   
                   if let querySnapshot = querySnapshot {
                       self.category = querySnapshot.documents.map({ item in
                           return categoryResponse(imageUrl: item["icon"] as? String ?? "",
                                                   title: item["name"] as? String ?? ""                   )
                       })
                   }
                   self.contentTableView.reloadData()
               }
               })
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
extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return names.count
        return category.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
   
        
       if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CategoryCell{
           cell.set(CategoryResponse: self.category[index])
           return cell
        }
      //  cell.contentView.backgroundColor = UIColor.clear
        
//        cell.name.text = category[index].title
//        cell.icon.image = UIImage(named: category[index].imageUrl)
////        cell.detailTextLabel?.text = number[index]
//
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vcName = viewPage[indexPath.row]
//        let index = indexPath.row
//
        if let vc = storyboard?.instantiateViewController(withIdentifier: vcName){
//            vc.imageNameLabel = images[inde]
//            vc.nameLabel = names[index]
//            vc.phoneLabel = number[index]

            navigationController?.pushViewController(vc, animated: true)
//
       }else{
//
       }
    }
}
