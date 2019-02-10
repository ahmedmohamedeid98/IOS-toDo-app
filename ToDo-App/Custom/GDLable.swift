import UIKit

class GDLable:UILabel {
    

    init(title:String = "default string" , color:UIColor = .white , size:CGFloat = 16 , textAlign:NSTextAlignment = .left  ,frame:CGRect = .zero)
    {
        super.init(frame: frame)
        if( frame == .zero)
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.highlightedTextColor = color
        self.font = UIFont.init(name:"Raleway-v4020-Regular", size: size)
        self.textAlignment = textAlign
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
