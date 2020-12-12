//  Created by MacOS on 12/17/1439 AH.
//  Copyright © 1439 AH MacOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    // create background subview
    let bg:UIView = {
        let view = GDGradiant()
        view.layer.cornerRadius = 16;
        return view;
    }()
    
    // create Lable text
    var textLable = GDLable(title: "GET IT DONE", size: 24, textAlign: .center)
    var infoLable:UILabel = {
        let lable =  GDLable(title: "WELCOME. GET IT DONE IS A TO DO LIST.\nA REALLY DOPE TO-DO-LIST", size: 14, textAlign: .center)
        lable.numberOfLines = 2
        return lable
    }()
    var copyRight:UILabel = {
        let copyright = GDLable(title: "© 2018 | ahmed eid", color: .grayOne , size: 14, textAlign: .center)
        return copyright
    }()
    
    var nextButton = GDButtons(title: "START WINNING", type: .roundText)
    
    //Button Action |_ blocking function
    @objc func nexthandle() {

        UIView.animate(withDuration: 0.1, delay:0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                let ListVC = ListViewController()
                ListVC.modalPresentationStyle = .fullScreen
            self.present(ListVC , animated: true, completion: nil)
            }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nextButton.addTarget(self, action: #selector(self.nexthandle), for: .touchUpInside)
        
        view.addSubview(bg)
        view.addSubview(copyRight)
        bg.addSubview(textLable)
        bg.addSubview(infoLable)
        bg.addSubview(nextButton)
        
        
        // CONSTRAINT
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -100).isActive = true
    
        textLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textLable.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textLable.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        textLable.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        infoLable.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLable.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLable.centerXAnchor.constraint(equalTo: bg.centerXAnchor ).isActive = true
        infoLable.centerYAnchor.constraint(equalTo: bg.centerYAnchor ).isActive = true
        
        copyRight.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyRight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyRight.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyRight.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
