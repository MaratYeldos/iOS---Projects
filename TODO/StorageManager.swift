//
//  StorageManager.swift
//  RealmApp
//
//  Created by Yeldos Marat on 09.07.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    // MARK: - Tasks Lists Methods
    
    static func saveTasksList(_ taskList: TasksList) {
        try! realm.write {
            realm.add(taskList)
        }
    }
    
    static func deleteList(_ tasksList: TasksList) {
        try! realm.write {
            let tasks = tasksList.tasks
            // here consistency plays an important role, first task then taskList
            realm.delete(tasks)
            realm.delete(tasksList)
        }
    }
    
    static func editList(_ tasksList: TasksList, newListName: String) {
        try! realm.write {
            tasksList.name = newListName
        }
    }
    
    static func makeAllDone(_ tasksList: TasksList) {
        try! realm.write {
            tasksList.tasks.setValue(true, forKey: "isComplete")
        }
    }
    
    // MARK: - Tasks Methods
    
    static func saveTask(_ taskList: TasksList, task: Task) {
        try! realm.write {
            taskList.tasks.append(task)
        }
    }
    
    static func editTask(_ task: Task, newTask: String, newNote: String) {
        try! realm.write {
            task.name = newTask
            task.note = newNote
        }
    }
    
    static func deleteTask(_ task: Task) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
    static func makeDone(_ task: Task) {
        try! realm.write {
            task.isComplete.toggle()
        }
    }
}
