//
//  ViewController.swift
//  My Address Book
//
//  Created by Anton Huisamen on 2018/06/13.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

struct Contact {
    let name: String
    let number: String
    
}


class HomeScreenViewController: UIViewController {
    
    var contacts:[Contact] = []
    
    
    
    let contactsView = UITableView()
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.image = UIImage(named: "AddressBookBackgroundImage")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add,
                                                            target: self,
                                                            action: #selector(handleAddButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain,
                                                           target: self, action: #selector(handleAddButtonTapped))
        view.addSubview(contactsView)
        title = "Contacts"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barStyle = .blackOpaque
        contactsView.register(CustomCell.self, forCellReuseIdentifier: "ContactsCell")
        addConstraintContactsView()
        customiseTableView()
        contactsView.dataSource = self
        contactsView.delegate = self
        constraintsImageView()
        
    }
    
    func addConstraintContactsView(){
        contactsView.translatesAutoresizingMaskIntoConstraints = false
        contactsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        contactsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        contactsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        contactsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func constraintsImageView(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    @objc func handleAddButtonTapped(){
        
        let contactAddingSheet = UIAlertController(title: "New Contact",
                                                   message: "Add Your Constact",
                                                   preferredStyle: UIAlertControllerStyle.alert)
        contactAddingSheet.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
        }
        
        contactAddingSheet.addTextField(configurationHandler: { (numberTextField) in
            numberTextField.placeholder = "Number"
        })
        
        contactAddingSheet.addAction(UIAlertAction(title: "SAVE",
                                                   style: UIAlertActionStyle.default,
                                                   handler: { (_) in
                                                    let name = contactAddingSheet.textFields![0].text
                                                    let number = contactAddingSheet.textFields![1].text
                                                    
                                                    self.contacts.append(Contact(name: name!, number: number!))
                                                    self.contactsView.reloadData()
        }))
        
        
        present(contactAddingSheet, animated: true, completion: nil)
        
        
        
    }
    
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! CustomCell
        cell.nameLabel.text = contacts[indexPath.row].name
        cell.numberLabel.text = contacts[indexPath.row].number
        
        return cell
    }
    
    func customiseTableView(){
        contactsView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
    }
    
    func customiseCustomCell(){
        
    }
    
}













