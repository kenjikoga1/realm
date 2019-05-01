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
    
    @IBOutlet weak var realmName: UILabel!
    @IBOutlet weak var realmAge: UILabel!
    @IBOutlet weak var realmGender: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func inputBtn(_ sender: Any) {
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let person = Person()
        person.name = nameTextField.text ?? ""
        person.age = Int(ageTextField.text!)!
        person.gender = genderTextField.text ?? ""
        
        try! realm.write {
            realm.add(person)
            print("成功")
        }
    }
    
    @IBAction func realmBtn(_ sender: Any) {
        let realm = try! Realm()
        let results = realm.objects(Person.self).value(forKey: "name")
        print(results)
        
    }
    
    
}

