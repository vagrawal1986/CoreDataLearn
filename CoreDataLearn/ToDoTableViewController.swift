//
//  ViewController.swift
//  CoreDataLearn
//
//  Created by Vivek Agrawal on 2/27/19.
//  Copyright © 2019 Vivek Agrawal. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var itemArray = ["find Mike", "Buy Eggs", "Destroy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK - Table vi
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }else{
             cell?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func PlusClicked(_ sender: UIBarButtonItem) {
        
        var textbox = UITextField()
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        
        ac.addTextField { (text) in
            text.placeholder = "Name of new item"
            textbox = text
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            if let text = textbox.text {
                self.itemArray.append(text)
                self.tableView.reloadData()
            }
        }
        ac.addAction(addAction)
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
    
}

