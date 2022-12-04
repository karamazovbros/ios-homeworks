//
//   LoginInspector.swift
//  Navigation
//
//  Created by Tatiana Volova on 13.06.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import Foundation

class LoginInspector: LoginViewControllerDelegate {
    func signIn(login: String, password: String) -> Bool {
        Checker.shared.validate(login: login, password: password)
    }
}
