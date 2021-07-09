//
//  Extention + UITableViewCell.swift
//  RealmApp
//
//  Created by Yeldos Marat on 09.07.2021.
//

import UIKit

extension UITableViewCell {
    func configure(with tasksList: TasksList) {
        let currentTasks = tasksList.tasks.filter("isComplete = false")
        let completedTasks = tasksList.tasks.filter("isComplete = true")
        
        textLabel?.text = tasksList.name
        
        if !currentTasks.isEmpty {
            detailTextLabel?.text = "\(currentTasks.count)"
        } else if !completedTasks.isEmpty {
            detailTextLabel?.text = "✅"
            detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        } else {
            detailTextLabel?.text = "0"
        }
    }
}
