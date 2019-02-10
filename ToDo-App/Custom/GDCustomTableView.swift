//
//  GDListCell.swift
//  project_Udamy
//
//  Created by MacOS on 1/21/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import UIKit

class GDCustomTableView:UITableViewCell{
    

    var delegate:GDFiltterTasks_p?
    
    @objc func toggleStatus()
    {
        if let toggle = self.box.toggle ,let text = self.textField.text,let id = self.toDo?.id,let delegate = self.delegate
        {
             CoreDateManager.Shared.deleteToDo(id: id)
             CoreDateManager.Shared.createToDo(id: id, title: text, status: !toggle)
             delegate.toggleToDo()
        }
    }
    
    let textField = GDTextField(placeholder: "to do", insets: 16)
    let view:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let box = GDButtonBox()
    
    var toDo:ToDo?{
        didSet{
            if let toDo = toDo{
                box.toggle = toDo.status
                self.textField.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.box.addTarget(self, action: #selector(toggleStatus), for: .touchUpInside)
        selectionStyle = .none
        backgroundColor = .clear
        view.backgroundColor = .white
        addSubview(view)
        view.rightAnchor.constraint(equalTo: rightAnchor ).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor ).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor , constant:3).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor , constant:-3).isActive = true
        
        addSubview(textField)
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor , constant:6).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor , constant:6).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor  , constant:-6).isActive = true
        
        addSubview(box)
        box.rightAnchor.constraint(equalTo: rightAnchor , constant: -14).isActive = true
        box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 23).isActive = true
        box.heightAnchor.constraint(equalTo: box.widthAnchor , multiplier: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
