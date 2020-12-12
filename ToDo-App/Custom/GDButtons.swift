import UIKit

class GDButtons:UIButton {
    
    var title:String!
    var corner:CGFloat!
    var titleColor:UIColor!
    var buttonColor:UIColor!
    var type:buttonOption!
    init(title:String = "button title" , titleColor:UIColor = .gray , bColor:UIColor = .white , cornerR:CGFloat = 20 ,  frame: CGRect = .zero , type:buttonOption = .roundText) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        self.corner = cornerR
        self.buttonColor = bColor
        self.titleColor = titleColor
        self.titleColor = UIColor.darkText
        
        self.phaseTwo()
        
    }
    
    
    func phaseTwo(){
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(self.titleColor, for: .normal)
        self.backgroundColor = self.buttonColor
        self.layer.cornerRadius = self.corner
        
        if (type == buttonOption.roundText) {
            return self.roudedIcon()
        } else if (type == buttonOption.squareIcon) {
            return self.squareIcon()
        }
    }
    
    func roudedIcon(){
        self.titleLabel?.font = UIFont(name:"Raleway-v4020-Regular", size: 16)
    }
    func squareIcon(){
        self.titleLabel?.font = UIFont(name:"Raleway-v4020-Regular", size: 24)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
