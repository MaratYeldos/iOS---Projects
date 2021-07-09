//
//  TaskViewController.swift
//  RealmApp
//
//  Created by Yeldos Marat on 08.07.2021.
//

import UIKit
import RealmSwift

class TasksListViewController: UITableViewController {
    
    var tasksLists: Results<TasksList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksLists = realm.objects(TasksList.self)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        alertForAddAndUpdateList()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tasksLists = tasksLists.sorted(byKeyPath: "name")
        } else {
            tasksLists = tasksLists.sorted(byKeyPath: "date")
        }
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasksLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)
        
        let taskList = tasksLists[indexPath.row]
        cell.textLabel?.text = taskList.name
        cell.detailTextLabel?.text = "\(taskList.tasks.count)"
        
        cell.configure(with: taskList)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let taskList = tasksLists[indexPath.row]
            let tasksVC = segue.destination as! TasksViewController
            tasksVC.currentTasksList = taskList
        }
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let currentList = tasksLists[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { _, _ in
            
            StorageManager.deleteList(currentList)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.alertForAddAndUpdateList(currentList) {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        let doneAction = UITableViewRowAction(style: .normal, title: "Done") { _, _ in
            StorageManager.makeAllDone(currentList)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        editAction.backgroundColor = .orange
        doneAction.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        return [deleteAction, doneAction, editAction]
    }
    
}


// MARK: - Extention TaskViewController

extension TasksListViewController {
    
    private func alertForAddAndUpdateList(_ listName: TasksList? = nil, completion: (()->Void)? = nil) {
        
        var title = "New List"
        var doneButton = "Save"
        
        if listName != nil {
            title = "Edit List"
            doneButton = "Update"
        }
        
        let alert = UIAlertController(title: title, message: "Please insert task value", preferredStyle: .alert)
        var taskTextField: UITextField!
        
        let saveAction = UIAlertAction(title: doneButton, style: .default) { _ in
            guard let newList = taskTextField.text , !newList.isEmpty else { return }
            
            if let listName = listName {
                StorageManager.editList(listName, newListName: newList)
                if completion != nil { completion!() }
            } else {
                let taskList = TasksList()
                taskList.name = newList
                
                StorageManager.saveTasksList(taskList)
                
                self.tableView.insertRows(at: [IndexPath(row: self.tasksLists.count - 1, section: 0)], with: .automatic)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
            
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            taskTextField = textField
            taskTextField.placeholder = "List Name"
        }
        
        
        if let listName = listName {
            taskTextField.text = listName.name
        }
        
        present(alert, animated: true)
    }
}
