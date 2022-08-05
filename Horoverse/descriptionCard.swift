//
//  descriptionCard.swift
//  Horoverse
//
//  Created by Paranan Vitpornnitipacha on 6/3/2565 BE.
//

import Foundation

import UIKit

@IBDesignable class descriptionCard : UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
   
    @IBInspectable let shadowOffSetWidth: Int = 0
    
    @IBInspectable let shadowOffSetHeight : Int = 1
    @IBInspectable var shadowOpacity : Float = 0.2
    override func layoutSubviews() {
    layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width:shadowOffSetWidth, height: shadowOffSetHeight)
    let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
}