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
    
    var cellNumber:Int = 0 //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        personMemo = realm.objects(Person.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //tableViewから戻ってきたときに入力
        let person = personMemo[cellNumber]
        nameTextField.text = person.name
        ageTextField.text = String(person.age)
        genderTextField.text = person.gender
    }

    @IBAction func inputBtn(_ sender: Any) {
        
        //空の場合
        if let text = nameTextField.text, text.isEmpty{
            let realm = try! Realm()
            //RealmのURLを取得
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            //PersonクラスにtextFieldの内容を記録
            let person = Person()
            person.name = nameTextField.text ?? ""
            person.age = Int(ageTextField.text!)!
            person.gender = genderTextField.text ?? ""
            person.id = NSUUID().uuidString
            //Realmに記録
            try! realm.write {
                realm.add(person)
                print("成功")
                print(personMemo)
            }
        }else{
            //空でない場合　viewWillApearに入っているものを編集して更新
            
        }
        
    }
    
}

