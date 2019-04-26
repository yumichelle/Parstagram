//
//  UIView-Extension.swift
//
//
//  Created by ellehcim on 3/15/19.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableTextField: UITextField {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

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

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}

extension UITextField
{
//    func setUpLayer(clearUITextField: UITextField?) {
////        sampleButton!.setTitle("--", for: UIControl.State.normal)
//        clearUITextField?.tintColor =  UIColor.white
////        clearUITextField!.frame = CGRect(x:50, y:500, width:170, height:40)
//        clearUITextField!.layer.borderWidth = 2.0
//        clearUITextField!.layer.borderColor = UIColor.white.withAlphaComponent(0.9).cgColor
//        clearUITextField!.layer.cornerRadius = 15.0
//        clearUITextField?.backgroundColor = UIColor.clear
////        clearUITextField!.layer.shadowRadius =  0.0
////        clearUITextField!.layer.shadowColor =  UIColor.white.withAlphaComponent(0.0).cgColor
////        clearUITextField!.layer.shadowOpacity =  0.0
//    }
//
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
