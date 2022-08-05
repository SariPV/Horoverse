//
//  dailyHoroCell.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 6/3/2565 BE.
//

import UIKit

import AlamofireImage

class DailyHoroCollectionViewCell: UICollectionViewCell {
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    
    override func prepareForReuse() {
            self.ImageView.image = nil
        }
        

        
    public func set(detailResponse: detailResponse) {
           
            
            if let url = URL(string: detailResponse.imaged) {
                self.ImageView.af.setImage(withURL: url, cacheKey: detailResponse.imaged, completion: nil)
            }
            
            self.NameLabel.text = detailResponse.title
            
        }

}

