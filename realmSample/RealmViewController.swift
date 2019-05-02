//
//  RealmViewController.swift
//  realmSample
//
//  Created by 古賀賢司 on 2019/04/30.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var personMemo: Results<Person>! //ModelをpersonMemoに代入
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let realm = try! Realm() //Realm初期化
        personMemo = realm.objects(Person.self) //realmの中身を代入
        tableView.reloadData() //tableVIewをリロード
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personMemo.count //realmのカラム数を返す
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        //各ラベルにtagをつけて初期化
        let nameLabel = cell.contentView.viewWithTag(1) as! UILabel
        let ageLabel = cell.contentView.viewWithTag(2) as! UILabel
        let genderLabel = cell.contentView.viewWithTag(3) as! UILabel
        
//        let realm = try! Realm()
//        personMemo = realm.objects(Person.self)

        let person = personMemo[indexPath.row] //各Cellの内容を代入
        nameLabel.text = person.name //各カラム項目をLabelに代入
        ageLabel.text = String(person.age)
        genderLabel.text = person.gender
        
        return cell
    }
    
    // MARK: - Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: personMemo[indexPath.row])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! ViewController
            vc.cellNumber = personMemo![Int(tableView.indexPathForSelectedRow!.row)]
    }
    

}
