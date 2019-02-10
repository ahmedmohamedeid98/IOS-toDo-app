//  Created by MacOS on 12/20/1439 AH.
//  Copyright © 1439 AH MacOS. All rights reserved.
//

import UIKit

class GDHeaderView:UIView{
    
    let bg = GDGradiant()
    let titleLable = GDLable()
    let subtitleLable = GDLable()
    var addButton:UIButton = {
    let bt = GDButtons(title: "", cornerR: 0, type: .squareIcon)
        bt.setImage(UIImage(named: "add-icon"), for: .normal)
        return bt
    }()
    var delegate:GDopenAddItemPopup_P? // create delegate from protocol
    
    var leftItem:Int = 0 {
        didSet{
            self.subtitleLable.text = "\(leftItem) Left"
        }
    }
    
    init(frame:CGRect = .zero , title:String = "header title" , subtitle:String = "0 left") {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        setupLayout()
        self.titleLable.text = title
        self.titleLable.font = UIFont.init(name: "Raleway-v4020-Regular", size: 14)
        self.subtitleLable.text = subtitle
        self.subtitleLable.font = UIFont.init(name: "Raleway-v4020-Regular", size: 24)
    }
    func setupLayout(){
        
        //bg constraint
        
        addSubview(bg)
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //titleLable constraint
        bg.addSubview(titleLable)
        titleLable.centerYAnchor.constraint(equalTo: centerYAnchor , constant: 12).isActive = true
        titleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20+8).isActive = true
    
        //subtitleLable Constraint
        bg.addSubview(subtitleLable)
        subtitleLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor).isActive = true
        subtitleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20+8).isActive = true
        
        //addButtton Constraint
        bg.addSubview(addButton)
        NSLayoutConstraint.activate([
        addButton.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20-8),
        addButton.bottomAnchor.constraint(equalTo: subtitleLable.bottomAnchor),
        addButton.heightAnchor.constraint(equalToConstant: 32),
        addButton.widthAnchor.constraint(lessThanOrEqualTo: addButton.heightAnchor , multiplier: 1)
        ])
        
        addButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        
       
    }
    @objc func buttonAction(){
        if let mydelegate = self.delegate{
            mydelegate.openAddItemPopup()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
