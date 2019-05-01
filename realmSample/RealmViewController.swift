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
    
    var personMemo: Results<Person>!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        personMemo = realm.objects(Person.self)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personMemo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)

        let nameLabel = cell.contentView.viewWithTag(1) as! UILabel
        let ageLabel = cell.contentView.viewWithTag(2) as! UILabel
        let genderLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        let realm = try! Realm()
        personMemo = realm.objects(Person.self)
//
        let person = personMemo[indexPath.row]
        nameLabel.text = person.name
        ageLabel.text = String(person.age)
        genderLabel.text = person.gender
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
