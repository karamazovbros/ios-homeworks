//
//  LoginFactoryProtocol.swift
//  Navigation
//
//  Created by Tatiana Volova on 15.06.2022.
//  Copyright © 2022 Tania. All rights reserved.
//

import Foundation

protocol LoginFactory {
    
    func createLoginInspector() -> LoginInspector
    
}
