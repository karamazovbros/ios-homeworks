//
//  Checker.swift
//  Navigation
//
//  Created by Tatiana Volova on 13.06.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import Foundation

class Checker {
    
    let storage: StorageType
    
    init(storage: StorageType){
        self.storage = storage
    }
    static let shared = Checker(storage: Storage())
    
    func validate(login: String, password: String) -> Bool {
        return login == storage.login && password == storage.password
    }
}

protocol StorageType {
    
    var login: String { get }
    var password: String { get }
}

class Storage: StorageType {
    
    let login: String = "таня"
    let password: String = "волова"
}

class CloudStorage: StorageType {
    
    let login: String = "таня"
    let password: String = "волова"
}
