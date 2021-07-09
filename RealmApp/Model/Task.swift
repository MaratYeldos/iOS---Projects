//
//  Task.swift
//  RealmApp
//
//  Created by Yeldos Marat on 08.07.2021.
//

import RealmSwift

class Task: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
}
