//
//  GDTextField.swift
//  project_Udamy
//
//  Created by MacOS on 1/14/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import UIKit

class GDTextField:UITextField {
    
    var insets:UIEdgeInsets!
    
    init(frame: CGRect = .zero , placeholder:String = "palceholder" , insets:CGFloat=0)
    {
        super.init(frame: frame)
        if frame == .zero
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = 10.0
        self.insets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GDTextField{
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,insets)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
}
