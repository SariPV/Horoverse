//
//  DailyHoroViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 5/3/2565 BE.
//

import UIKit
import FirebaseFirestore
//var horo = [ "Aquarius", "Pisces", "Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio","Sagitarius","Capricorn"]
//var images = ["image 2","image 3", "image 4","image 5","image 6","image 7","image 8", "image 9","image 10","image 11","image 12","image 13"]
class DailyHoroViewController: UIViewController {
    @IBOutlet weak var dailyCollectionView: UICollectionView!
    var daily: [detailResponse] = []
    
//    @IBOutlet var icon : UIImageView!
//    @IBOutlet var horolabel: UILabel!

   
    override func viewDidLoad() {
        title = "Daily Horoscope"
        navigationController?.navigationBar.tintColor = UIColor(red:0.941, green:0.843, blue: 0.439, alpha: 1);
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red:0.941, green:0.843, blue: 0.439, alpha: 1)]
        
//        navigationController?.navigationBar.barTintColor = UIColor.purple
        // Navigation Bar:
     
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        let database = Firestore.firestore().collection("Category").document("dailyHoro").collection("detail")
        database.getDocuments(completion: { querySnapshot, err in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       print("\(document.documentID) => \(document.data())")
                   }
                   
                   if let querySnapshot = querySnapshot {
                       self.daily = querySnapshot.documents.map({ item in
                           return detailResponse(imaged: item["image"] as? String ?? "",
                                                   title: item["name"] as? String ?? "" , description: item["description"] as? String ?? ""                   )
                       })
                   }
                   self.dailyCollectionView.reloadData()
               }
               })
   }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//        navigationItem.setHidesBackButton(true, animated: true)
//    }

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
extension DailyHoroViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daily.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

      //  let index = indexPath.row
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2",for: indexPath) as! DailyHoroCollectionViewCell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2",for: indexPath) as? DailyHoroCollectionViewCell{
            
            cell.set(detailResponse: self.daily[indexPath.row])
            return cell
         }
       
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let index = indexPath.row
//        print(planets[index].name)
//    }
    
//
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detailScene") as? CustomModelViewController{
            vc.names = daily[indexPath.row].title
            vc.images = daily[indexPath.row].imaged
            vc.details = daily[indexPath.row].description
//            vc.imageName = planets[indexPath.row].imageName
         present(vc, animated: true, completion: nil)
//        }else{
//            
        }
      
    }
  
    
    }
