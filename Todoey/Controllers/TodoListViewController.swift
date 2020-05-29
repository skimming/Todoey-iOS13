//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
   
    var tasks = Array<TaskItem>()
    
    let defaults = UserDefaults.standard
    
    @IBAction func addNewItem(_ sender: Any) {
        
        let ac = UIAlertController(title: "Add Another Item", message: "Type in new Todo item!", preferredStyle: .alert)
        
        ac.addTextField(configurationHandler: { (alertTextField) in
            alertTextField.placeholder = "CREATE NEW"
        })
        
        let aa = UIAlertAction(title: "Add", style: .default) {(uiAlertAction) in
            if let task = ac.textFields?[0].text {
                self.tasks.append(TaskItem(task))
            }
            self.tableView.reloadData()
        }
        ac.addAction(aa)
        present(ac, animated: true)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...32 {
            tasks.append(TaskItem("something \(i)"))
        }
    }
    
    // numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    // cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.todoItemCell, for: indexPath)
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.taskName
        if (task.isChecked) {
            print ("isChecked")
        }
        cell.accessoryType = task.isChecked ? .checkmark : .none
        
        return cell
    }
    
    // create delegate method when user clicks on a cell in the table view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print ("row @ \(indexPath.row)  [\(itemArray[indexPath.row])] clicked")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tasks[indexPath.row].isChecked = !tasks[indexPath.row].isChecked
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = tasks[indexPath.row].isChecked ? .checkmark : .none
        }
        
    }    
}

