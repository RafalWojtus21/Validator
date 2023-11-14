//
//  BoolData.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation

@Observable final class UserConfig: Identifiable {
    var info: [UserInfo]
    
    init(info: [UserInfo]) {
        self.info = info
    }
}
