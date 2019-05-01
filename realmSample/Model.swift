//
//  Model.swift
//  realmSample
//
//  Created by 古賀賢司 on 2019/05/01.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age:Int = 0
    @objc dynamic var gender = ""
}
