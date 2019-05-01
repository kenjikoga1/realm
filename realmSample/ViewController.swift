//
//  ViewController.swift
//  realmSample
//
//  Created by 古賀賢司 on 2019/04/29.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    var personMemo: Results<Person>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        personMemo = realm.objects(Person.self)
    }

    @IBAction func inputBtn(_ sender: Any) {
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let person = Person()
        person.name = nameTextField.text ?? ""
        person.age = Int(ageTextField.text!)!
        person.gender = genderTextField.text ?? ""
        person.id = NSUUID().uuidString
        
        try! realm.write {
            realm.add(person)
            print("成功")
        }
    }
    
}

