import UIKit

extension UIColor {
    
    static var blueZero:UIColor = {
        return UIColor.init(rgb: 0x64E4FF)
    }()
    static var blueOne: UIColor = {
        return UIColor.init(rgb: 0x3A7BD5)
    }()
    static var grayOne:UIColor = {
        return UIColor.init(rgb: 0x242424)
    }()

    static var grayZero: UIColor = {
        return UIColor.init(rgb: 0x9B9B9B)
    }()
    
    convenience init(red: Int,green: Int,blue: Int){
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    
    convenience init(rgb: Int){
        self.init(
        red: (rgb >> 16) & 0xFF,
        green: (rgb >> 8) & 0xFF,
        blue : rgb & 0xFF)
    }
    
}

extension UIView{
    func animated_func(transform:CGAffineTransform , durarion:TimeInterval = 0.3){
        UIView.animate(withDuration: durarion, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.transform = transform
        }, completion: nil)
    }
}
