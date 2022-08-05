//
//  CategoryCell.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 26/2/2565 BE.
//

import UIKit
import AlamofireImage

class CategoryCell: UITableViewCell {
    
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
            self.icon.image = nil
        }
        
    public func set(CategoryResponse: categoryResponse) {
           
            
            if let url = URL(string: CategoryResponse.imageUrl) {
                self.icon.af.setImage(withURL: url, cacheKey: CategoryResponse.imageUrl, completion: nil)
            }
            
            self.name.text = CategoryResponse.title
            
        }

       

}

