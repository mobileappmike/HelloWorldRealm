//
//  ViewController.swift
//  HelloWorldRealm
//
//  Created by Michael Miles on 11/29/18.
//  Copyright © 2018 Michael Miles. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var names : Results<Example>?
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadItems()
    }

    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let newName = Example()
        
        newName.name = textField.text!
        
        do {
            try realm.write {
                realm.add(newName)
            }
        } catch {
            print("Error saving name \(error)")
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        
        cell.textLabel?.text = names?[indexPath.row].name ?? "no names added yet"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "Update string", message: "", preferredStyle: .alert)
//        var updateTextField = UITextField()
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "Update name"
//            updateTextField = alertTextField
//        }
//        let action = UIAlertAction(title: "update name", style: .default) { (action) in
//            if let name = self.names?[indexPath.row] {
//            do {
//                try self.realm.write {
//                    name.name = updateTextField.text!
//                    self.loadItems()
//                }
//            } catch {
//                print("Error saving updated data \(error)")
//            }
//        }
//        }
//
//        alert.addAction(action)
//
//        present(alert, animated: true, completion: nil)
        
        if let name = names?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(name)
                    loadItems()
                }
            } catch {
                print("error deleting items \(error)")
            }
        }
    }
    
    func loadItems() {
        names = realm.objects(Example.self)
        
        tableView.reloadData()
    }
}

