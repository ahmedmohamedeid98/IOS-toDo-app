//  Created by MacOS on 1/14/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import UIKit

class GDNewItemPopup:GDGradiant{
    let cancelButton = GDButtons(title: "Cancel", cornerR: 10.0, type: .roundText)
    let addButton = GDButtons(title: "add", cornerR: 10.0,type: .roundText)
    let textField = GDTextField(placeholder: "add new item " , insets:6 )
    var delegate:GDaddItemToList_P?
    override init(frame:CGRect = .zero) {
        super.init(frame: frame)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animatedPopup)))
        self.layer.cornerRadius = 14
        self.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        addSubview(cancelButton)
        addSubview(addButton)
        addSubview(textField)
        NSLayoutConstraint.activate([
        cancelButton.widthAnchor.constraint(equalToConstant: 120),
        cancelButton.heightAnchor.constraint(equalToConstant: 30),
        cancelButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
        cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
        

        addButton.widthAnchor.constraint(equalToConstant: 120),
        addButton.heightAnchor.constraint(equalToConstant: 30),
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
        addButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
        
        
        textField.heightAnchor.constraint(equalToConstant: 36),
        textField.leftAnchor.constraint(equalTo: leftAnchor , constant: 15),
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        
        ])
        
        cancelButton.addTarget(self, action: #selector(self.cancelAction), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(self.addAction), for: .touchUpInside)

    }
    var popupLocation:CGFloat = 85
    @objc func animatedPopup(){
        textField.resignFirstResponder() 
        self.animated_func(transform: CGAffineTransform(translationX: 0, y: popupLocation), durarion: 0.3)
        if popupLocation == 85{
        popupLocation = 0
        }else{
        popupLocation = 85
        }
    }
    
    @objc func cancelAction(){
       self.animatedPopup()
       self.textField.text = ""
    }
    @objc func addAction(){
        // if you can found delegate's method impelement you can excute it else do not make the app crach
        if let mydelegate = self.delegate {
            mydelegate.addItemToList()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
