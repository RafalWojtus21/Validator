//
//  UserData.swift
//  Validator
//
//  Created by Rafał Wojtuś on 15/11/2023.
//

import Foundation

enum UserDataType {
    case email
    case name
    case date
    case height
    case weight
}

struct UserData {
    let name: String
    let email: String
    let birthDate: Date
    let height: Int
    let weight: Int
}
