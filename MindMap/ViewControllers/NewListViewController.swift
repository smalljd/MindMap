//
//  NewListViewController.swift
//  MindMap
//
//  Created by Jeff on 9/5/16.
//  Copyright © 2016 Jeff Small. All rights reserved.
//

import UIKit

class NewListViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var newListView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newListView.layer.borderWidth = 1
        newListView.layer.borderColor = UIColor.lightGray.cgColor
        newListView.layer.cornerRadius = 5
        
        textField.delegate = self
    }
}

extension NewListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let listName = textField.text,
            !listName.isEmpty else
        {
            dismiss(animated: true, completion: nil)
            return true
        }
        
        addList(named: listName)
        return true
    }
}


extension NewListViewController {
    func addList(named name: String) {
        guard !name.isEmpty else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        ListStore.store.add(list: List(title: name))
        textField.text = nil
        dismiss(animated: true, completion: nil)
    }
}

// MARK: IBActions
extension NewListViewController {
    @IBAction func createListButtonTapped(_ sender: AnyObject) {
        guard let listName = textField.text else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        addList(named: listName)
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        textField.text = nil
        dismiss(animated: true, completion: nil)
    }
}

