import UIKit


class GDGradiant:UIView {
    
    /// Use this
    var colors:[CGColor] = [
        UIColor.init(red: 100, green:228,blue:255).cgColor,
        UIColor.init(red: 58, green:123,blue:213).cgColor
    ]
    /// Or
    var hexColor:[CGColor] = [
        UIColor.init(rgb: 0x64E4FF).cgColor,
        UIColor.init(rgb: 0x3A7BD5).cgColor
    ]
    /// Or
    var staticColor:[CGColor] = [
        UIColor.blueZero.cgColor ,
        UIColor.blueOne.cgColor
    ]
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        if let layer = self.layer as? CAGradientLayer{
            self.translatesAutoresizingMaskIntoConstraints = false
            layer.colors = [UIColor.purple.cgColor,UIColor.darkGray.cgColor]
            layer.locations = [ 0.0 , 1.2 ]
        }
    }
    override class var layerClass : AnyClass{
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
