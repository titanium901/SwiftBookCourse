//
//  ViewController.swift
//  lesson8
//
//  Created by Yury Popov on 18/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var realm: Realm!
    
    var objectsArray: Results<Item>!
    
    
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 80
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var addButton = UIBarButtonItem()
    var editButton = UIBarButtonItem()
    var segmentetControl = UISegmentedControl()
    var isEditingMode = false
    var segmentedController: UISegmentedControl!
    
    override func loadView() {
        super.loadView()
        
        let items = ["Sorting by name", "Sorting by Date"]
        
        segmentedController = UISegmentedControl(items: items)
        navigationItem.titleView = segmentedController
        segmentedController.tintColor = .black
        segmentedController.addTarget(self, action: #selector(sortingBy), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        objectsArray =  realm.objects(Item.self) // подгружаем данные из realm
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        
        setup()
        setupTableView()
    }
    
    
    func setup() {
        view.backgroundColor = .white
        navigationItem.title = "ToDo List"
        navigationController?.navigationBar.prefersLargeTitles = true
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        addButton.tintColor = .black
        navigationItem.rightBarButtonItem = addButton
        editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editItem))
        editButton.tintColor = .black
        navigationItem.leftBarButtonItem = editButton
//        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barTintColor = UIColor(
            displayP3Red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 1)
        
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyCell.self, forCellReuseIdentifier: MyCell.reuseIdentifier)
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

    @objc func sortingBy() {
        
        
        switch segmentedController.selectedSegmentIndex {
        case 0:
            objectsArray = objectsArray.sorted(byKeyPath: "name")
        case 1:
            objectsArray = objectsArray.sorted(byKeyPath: "date")
        default:
            print("no")
        }
        
        tableView.reloadData()
    }
    
    
    @objc func addNewItem() {
        let alertVC = UIAlertController(title: "Add New Item", message: "What do you want to do?", preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) -> Void in
            let myTextField = (alertVC.textFields?.first)! as UITextField
            guard let text = myTextField.text, !text.isEmpty else { return }
            
            let item = Item()
            item.name = text
            
            try! self.realm.write {
                self.realm.add(item)
                self.tableView.insertRows(at: [IndexPath(row: self.objectsArray.count - 1, section: 0)], with: .automatic)
            }
            
            
            
        }
        
        alertVC.addAction(addAction)
        alertVC.addAction(cancelAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    @objc func editItem() {
        isEditingMode = !isEditingMode
        tableView.setEditing(isEditingMode, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if objectsArray != nil {
            return objectsArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.reuseIdentifier, for: indexPath) as! MyCell
        let item = objectsArray[indexPath.row]
        cell.todoImageView.image = UIImage(named: "todo")
        cell.todoLabel.text = item.name
        cell.todoImageView.image = UIImage(named: item.picture)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = objectsArray[indexPath.row]
            try! self.realm.write {
                self.realm.delete(item)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

class MyCell: UITableViewCell {
    
    static let reuseIdentifier = "cell"
    
    let todoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let todoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(todoImageView)
        addSubview(todoLabel)
        
        todoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        todoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        todoImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        todoImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        todoLabel.leftAnchor.constraint(equalTo: todoImageView.rightAnchor, constant: 10).isActive = true
        todoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

}
