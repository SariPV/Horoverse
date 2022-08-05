//
//  ChineseHoroCollectionViewCell.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 7/3/2565 BE.
//

import UIKit
import AlamofireImage

class ChineseHoroCollectionViewCell: UICollectionViewCell {
    @IBOutlet var animalImage: UIImageView!
    @IBOutlet var animalName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
 
    override func prepareForReuse() {
            self.animalImage.image = nil
        }
        

        
    public func set(detailResponse: detailResponse) {
           
            
            if let url = URL(string: detailResponse.imaged) {
                self.animalImage.af.setImage(withURL: url, cacheKey: detailResponse.imaged, completion: nil)
            }
            
            self.animalName.text = detailResponse.title
            
        }

}
