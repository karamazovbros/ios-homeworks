//
//  Checker.swift
//  Navigation
//
//  Created by Tatiana Volova on 13.06.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
    private let login = "Vasily"
    private let password = "StrongPassword"
    
    func validate(login: String, password: String) -> Bool {
        return login == self.login && password == self.password
    }
}
