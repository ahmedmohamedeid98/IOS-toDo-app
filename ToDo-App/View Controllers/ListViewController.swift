import  UIKit

class ListViewController:UIViewController , GDaddItemToList_P , GDopenAddItemPopup_P {
    
    // create TableView background
    let bg:UIView = {
        let view = GDGradiant()
        view.layer.cornerRadius = 14;
        return view;
    }()
    // cell identifier
    let CELL_ID = "cell_id"
    // make bottom constraint for the background
    var bgBottom:NSLayoutConstraint!
    
    func openAddItemPopup() {
        newItemView.animatedPopup()
    }
    
    func notInList(text:String) -> Bool
    {
        var isNotInList:Bool = true
        self.DataList.forEach { (toDo) in
            if toDo.title == text{
                isNotInList = false
            }
        }
        return isNotInList
    }
    
    func addItemToList() {
        let text:String = newItemView.textField.text!
        if (notInList(text: text)){
            CoreDateManager.Shared.createToDo(id: Double(self.DataList.count), title: text, status: false)
            self.DataList = CoreDateManager.Shared.fetchToDo()
            self.listTable.reloadData()
            self.updateHeaderLeftItem()
            self.newItemView.animatedPopup()
            self.newItemView.textField.text = ""
        }else{
            self.newItemView.animatedPopup()
            self.newItemView.textField.text = ""
        }
    }
    
    let header = GDHeaderView(title: "stufe to be done", subtitle: "4 left")
    let newItemView = GDNewItemPopup()
    let listTable = GDTableView()
    var DataList:[ToDo] = [ToDo]()
    var taskIsDone:[ToDo] = []
    var taskNotDone:[ToDo] = []
    

    /// Calculate Height of keyboard
    var keyboardHeight:CGFloat = 290
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillshow(notification:)), name:NSNotification.Name.UIKeyboardDidShow, object:nil)
    }
    @objc func keyboardWillshow(notification: Notification){
        let keyboardsize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardHeight = keyboardsize.height
    }
    
    func updateHeaderLeftItem(){
        header.leftItem = 0
        self.DataList.forEach{ (toD) in
            if !toD.status {header.leftItem += 1}
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        DataList = CoreDateManager.Shared.fetchToDo()
        
        self.updateHeaderLeftItem()
        
        /// conform delegates
        header.delegate = self
        newItemView.textField.delegate = self
        newItemView.delegate = self
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDCustomTableView.self, forCellReuseIdentifier: CELL_ID)
        
        /// adding subview
        view.addSubview(bg)
        view.addSubview(header)
        view.addSubview(newItemView )
        
        
        
        /// constraint
        
        
        NSLayoutConstraint.activate([
        header.topAnchor.constraint(equalTo: view.topAnchor),
        header.leftAnchor.constraint(equalTo: view.leftAnchor),
        header.rightAnchor.constraint(equalTo: view.rightAnchor),
        header.heightAnchor.constraint(equalToConstant: 120),
        
        newItemView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        newItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20+8),
        newItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20-8),
        newItemView.heightAnchor.constraint(equalToConstant: 100)
        
        ])
        openAddItemPopup()
        
        
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor , constant: 20).isActive = true
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant:-120)
        bgBottom.isActive = true
        bg.addSubview(listTable)
        
        listTable.leftAnchor.constraint(equalTo:bg.leftAnchor , constant: 8).isActive=true
        listTable.rightAnchor.constraint(equalTo:bg.rightAnchor , constant : -8).isActive=true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: 8).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -8).isActive=true
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var toDoToUpdate:ToDo?
}






extension ListViewController: UITextFieldDelegate , UITableViewDelegate , UITableViewDataSource ,GDFiltterTasks_p {
    
    /* map-syntax
     let resultCollection = inputCollection.map { (elementOfCollection) -> ResultType in
     return //something related to the element
     }
     */
    
    /// Update The List (todo - done)
    func toggleToDo()
    {
//        let newDataList = self.DataList.map
//        { (toDo) -> ToDo in
//            if toDo.id == updatedToDo.id
//            {
//                let newToDo = toDo
//                newToDo.status = updatedToDo.status
//                newToDo.title = updatedToDo.title
//                return newToDo
//            }
//            return toDo
//        }
        self.DataList = CoreDateManager.Shared.fetchToDo()
        self.listTable.reloadData()
        self.updateHeaderLeftItem()
        
    }
    
    /// Table View function
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        self.DataList.forEach { (ToDo) in
            if  section == 0 && !ToDo.status {
                count += 1
            }else if section == 1 && ToDo.status {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDCustomTableView
        cell.delegate = self
        cell.textField.delegate = self
        var taskInTable:[ToDo] = []
        self.DataList.forEach
        { (toDo) in
            if indexPath.section == 0 && !toDo.status
            {
                taskInTable.append(toDo)
            }else if indexPath.section == 1 && toDo.status
            {
                taskInTable.append(toDo)
            }
        }
        cell.toDo = taskInTable[indexPath.row];
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 44;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44;
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2;
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
       if section == 0 {
            return "to do"
        }        else{
           return "done"
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let header = GDLable(color: UIColor.white, size: 20, frame: CGRect(x: 0, y: 0, width:tableView.frame.width, height: 48))
        if section == 0 {
                header.text = "to do"
        }else{
            header.text = "done"
        }
        return header
    }
    
    /// Menage the animate of footer view
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        var Hight:CGFloat = -keyboardHeight - 20
        
        if textField == newItemView.textField
        {
            newItemView.animated_func(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), durarion: 0.5)
            Hight -= 90
        }else{
            toDoToUpdate = CoreDateManager.Shared.fetchToDo(title: textField.text!)
        }
        
        self.bgBottom.constant = Hight
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        let Hight:CGFloat = -120
        if textField  == newItemView.textField
        {
            newItemView.animated_func(transform: CGAffineTransform(translationX: 0, y: 0), durarion: 0.6)
        }else{
            if let toDoToUpdate = self.toDoToUpdate{
                CoreDateManager.Shared.deleteToDo(id: toDoToUpdate.id)
                CoreDateManager.Shared.createToDo(id: toDoToUpdate.id, title: textField.text!, status: toDoToUpdate.status)
            }
        }
            self.bgBottom.constant = Hight
            UIView.animate(withDuration: 0.3)
            {
                self.view.layoutIfNeeded()
            }
  }
}
