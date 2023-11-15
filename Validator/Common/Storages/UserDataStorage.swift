//
//  UserDataStorage.swift
//  Validator
//
//  Created by Rafał Wojtuś on 15/11/2023.
//


import Foundation
import Combine


protocol HasUserDataStorage {
//    var userDataStorage: UserDataStorage { get }
}

//protocol UserDataStorage {

//    func setName(_ name: UserName)
//    func setEmail(_ email: UserEmail)
//    func setBirthDate(_ date: UserBirthDate)
//    func setHeight(_ height: UserHeight)
//    func setWeight(_ weight: UserWeight)
//
//}

@Observable final class UserDataStorageImpl {
    
    typealias UserName = String
    typealias UserEmail = String
    typealias UserBirthDate = Date
    typealias UserHeight = Int
    typealias UserWeight = Int

    // MARK: - Properties
    
    private var userDataSubject: CurrentValueSubject<UserData?, Never> = .init(nil)
    private var userNameSubject: CurrentValueSubject<UserName, Never> = .init("")
    private var userEmailSubject: CurrentValueSubject<UserEmail, Never> = .init("")
    private var userBirthDateSubject: CurrentValueSubject<UserBirthDate, Never> = .init(Date())
    private var userHeightSubject: CurrentValueSubject<UserHeight, Never> = .init(0)
    private var userWeightSubject: CurrentValueSubject<UserWeight, Never> = .init(0)

    // MARK: - Initialization
    
    init() {}
    
    // MARK: - Public implementation
    
    func setName(_ name: UserName) {
        userNameSubject.send(name)
    }
    
    func setEmail(_ email: UserEmail) {
        userEmailSubject.send(email)
    }
    
    func setBirthDate(_ date: UserBirthDate) {
        userBirthDateSubject.send(date)
    }
    
    func setHeight(_ height: UserHeight) {
        userHeightSubject.send(height)
    }
    
    func setWeight(_ weight: UserWeight) {
        userWeightSubject.send(weight)
    }
    
    func saveUserData() {
        let userData = UserData(
            name: userNameSubject.value,
            email: userEmailSubject.value,
            birthDate: userBirthDateSubject.value,
            height: userHeightSubject.value,
            weight: userWeightSubject.value
        )
        
        userDataSubject.send(userData)
    }
    
    func fetchUserData() -> UserData? {
        userDataSubject.value
    }

    // MARK: - Private implementation
    
}
