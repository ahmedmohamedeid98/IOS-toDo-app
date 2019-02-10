//  Created by MacOS on 1/25/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import UIKit

class GDButtonBox:UIButton{
 
    var toggle:Bool?
    {
        didSet
        {
            UIView.animate(withDuration: 0.3, animations: {
                if let isToggle = self.toggle
                {
                    if isToggle
                    {
                        self.backgroundColor = .green
                        self.setImage(UIImage(named: "done-icon") , for: .normal)
                    }
                    else
                    {
                        self.backgroundColor = .clear
                        self.setImage(UIImage(named: ""), for: .normal)
                    }
                }
            }, completion: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        if frame == .zero{
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
