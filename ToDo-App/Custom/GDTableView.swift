//  Created by MacOS on 1/20/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import UIKit

class GDTableView:UITableView{
    
    
    override init(frame: CGRect, style: UITableView.Style)
    {
        super.init(frame: frame, style: style)
        if frame == .zero
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.backgroundColor = .clear
        self.separatorStyle = .none
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
