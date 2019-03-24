//
//  UIView-Extension.swift
//
//
//  Created by ellehcim on 3/15/19.
//

import Foundation
import UIKit

extension UIView{
    
    func setGradient(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor)
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y:1.0)
//        gradientLayer.locations = [0.0, 1.0]
        //location is where the 2 colors mix. 0 and 1 means it blends in the middle
        gradientLayer.frame = self.bounds
        // same size as object
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    
}
