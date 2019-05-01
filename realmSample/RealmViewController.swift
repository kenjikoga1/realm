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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        let results = realm.objects(Person.self)
        print(results)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        
        let realm = try! Realm()

        let nameLabel = cell.contentView.viewWithTag(1) as! UILabel
        let ageLabel = cell.contentView.viewWithTag(2) as! UILabel
        let genderLabel = cell.contentView.viewWithTag(3) as! UILabel
//
        let names = realm.objects(Person.self).value(forKey: "name")
        
//        let namesNumber = results[indexPath.row]

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
