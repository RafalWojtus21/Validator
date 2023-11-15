//
//  UserInfo.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation

@Observable final class UserInfo: Identifiable, Equatable {
    private(set) var id: UUID = .init()
    
    let type: UserDataType
    let description: String
    
    var dateTime: Date = .init()
    var stringData: String = ""
    var integerData: Int = 0
    
    static func == (lhs: UserInfo, rhs: UserInfo) -> Bool {
        lhs.id == rhs.id
    }
    
    init(type: UserDataType, description: String) {
        self.type = type
        self.description = description
    }
    
}
