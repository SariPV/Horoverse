//
//  ChineseHoroViewController.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 7/3/2565 BE.
//

import UIKit
import FirebaseFirestore

class ChineseHoroViewController: UIViewController {
    @IBOutlet weak var chineseCollectionView: UICollectionView!
    var chinese: [detailResponse] = []
//   var names = ["RAT","OX","SNAKE","MONKEY","GOAT","RABBIT","DRAGON", "TIGER","PIG","ROASTER","HORSE","DOG"]
//    var images = ["rat","ox","snake","monkey","goat","rabbit","dragon","tiger","pig","roaster","horse","dog"]

    override func viewDidLoad() {
        title = "Chinese Horoscope"
        navigationController?.navigationBar.tintColor = UIColor(red:0.941, green:0.843, blue: 0.439, alpha: 1);
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red:0.941, green:0.843, blue: 0.439, alpha: 1)]
//        navigationController?.navigationBar.tintColor = UIColor(red:0.941, green:0.843, blue: 0.439, alpha: 1)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let db = Firestore.firestore().collection("Category").document("chineseHoro").collection("detail")
            db.getDocuments(completion: { querySnapshot, err in
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       print("\(document.documentID) => \(document.data())")
                   }
                   
                   if let querySnapshot = querySnapshot {
                       self.chinese = querySnapshot.documents.map({ item in
                           return detailResponse(imaged: item["image"] as? String ?? "",
                                                   title: item["name"] as? String ?? "" , description: item["description"] as? String ?? ""                   )
                       })
                   }
                   self.chineseCollectionView.reloadData()
               }
               })
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
extension ChineseHoroViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chinese.count
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//             return CGSize(width: 120.0, height: 128.0)
//          }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

       // let index = indexPath.row
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chineseCell",for: indexPath) as! ChineseHoroCollectionViewCell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chineseCell",for: indexPath) as? ChineseHoroCollectionViewCell{
            
            cell.set(detailResponse: self.chinese[indexPath.row])
            return cell
         }
      // let index = indexPath.row
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyHorocell", for: indexPath) as! CollectionViewCell
//        cell.planetImageView.image = UIImage(named: planets[index].imageName)
//        cell.planetNameLabel.text = planets[index].name
//
//        cell.animalImage?.image = UIImage(named: images[index])
//        cell.animalName.text = names[index]
       
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let index = indexPath.row
//        print(planets[index].name)
//    }
//
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
       if let vc = storyboard?.instantiateViewController(withIdentifier: "chineseDetailScene") as? ChineseViewModel{
           vc.names = chinese[index].title
           vc.images = chinese[index].imaged
           vc.details = chinese[index].description
//            vc.imageName = planets[indexPath.row].imageName
        present(vc, animated: true, completion: nil)
        }else{

        }
      
    }
    
    
    }
