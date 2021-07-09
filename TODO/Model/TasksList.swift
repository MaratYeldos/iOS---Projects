//
//  TasksList.swift
//  RealmApp
//
//  Created by Yeldos Marat on 08.07.2021.
//

import RealmSwift

class TasksList: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    let tasks = List<Task>()
}
