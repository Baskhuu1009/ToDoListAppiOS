//
//  User.swift
//  LadyBug
//
//  Created by baskhuu batpurev on 2019/06/09.
//  Copyright © 2019 Batpurev BASKHUU. All rights reserved.
//

import Foundation
import RealmSwift

class Users: Object {
    @objc dynamic var name: String?
    @objc dynamic var password: String?
    @objc dynamic var mail: String?
}
