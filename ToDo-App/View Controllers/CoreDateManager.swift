//
//  CoreDateManager.swift
//  project_Udamy
//
//  Created by MacOS on 5/23/1440 AH.
//  Copyright © 1440 AH MacOS. All rights reserved.
//

import CoreData

class CoreDateManager {
    static let Shared = CoreDateManager()
    
    let persistentContainer : NSPersistentContainer = {
        let Container = NSPersistentContainer(name: "toDoApp")
        Container.loadPersistentStores(completionHandler: { (storeDescription, err) in
            if let err = err {
                fatalError("loading of Store Failed! : \(err)")
            }
        })
        return Container
    }()
    

    func createToDo(id:Double , title:String , status:Bool){
        let context = persistentContainer.viewContext
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
    
        
        toDo.setValue(id, forKey: "id")
        toDo.setValue(title, forKey: "title")
        toDo.setValue(status, forKey: "status")
        
        
        do{
            try context.save()
        }catch let err {
            print("save is faild! with err \(err)")
        }
    }
    
    func deleteToDo(id:Double){
        let context = persistentContainer.viewContext
        let request = NSFetchRequest <ToDo>(entityName: "ToDo")
        
        do{
            let fetchData = try context.fetch(request)
            fetchData.forEach { (fetchElement) in
                if fetchElement.id == id{
                    context.delete(fetchElement)
                }
            }
        }catch let err{
            print("Faild to fetch data or delete the elemnt with Error:\(err)")
        }
    }
    
    func fetchToDo(title:String) -> ToDo?{
        let context = persistentContainer.viewContext
        let request = NSFetchRequest <ToDo>(entityName: "ToDo")
        
        var toDo:ToDo?
        do{
            let fetchData = try context.fetch(request)
            fetchData.forEach { (fetchDataElement) in
                if fetchDataElement.title == title {
                    toDo = fetchDataElement
                }
            }
        }catch let err{
            print("Faild to fetch data to updata! with Error: \(err)")
        }
        return toDo
    }
    
    func fetchToDo() -> [ToDo]{
        let context = persistentContainer.viewContext
        let request = NSFetchRequest <ToDo>(entityName: "ToDo")
        
        do{
            let toDo = try context.fetch(request)
            return toDo
        }catch let err{
            print("faild to fetch data! error:\(err)")
            return []
        }
    }
}
