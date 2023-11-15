//
//  Validator.swift
//  Validator
//
//  Created by Rafał Wojtuś on 14/11/2023.
//

import Foundation
import Combine

enum Validation {
    
    enum ValidationType: String {
        case email
        case name
        case birthDate
        case height
        case weight

        enum RegexPatterns: String {
            case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            case name = "^[a-zA-Z]{3,40}$"
            case date = "^(0[1-9]|[12][0-9]|3[01])\\.(0[1-9]|1[0-2])\\.\\d{4}$"
            case age = "^(8|9|[1-9][0-9]|1[0-2][0-9])"
            case height = "^[8-9][0-9]|1[0-9][0-9]|2[0-3][0-9]"
            case weight = "^[3-9][0-9]|1[0-9][0-9]|2[0-4][0-9]"
        }
        
        var predicates: [(predicate: NSPredicate, errorMessage: String)] {
            switch self {
            case .email:
                return [(NSPredicate.matchPredicate(regex: .email),
                         "Please enter a valid e-mail.")]
            case .name:
                return [(NSPredicate.matchPredicate(regex: .name),
                         "Please enter a valid name.")]
            case .birthDate:
                return [(NSPredicate.agePredicate(minAge: 8),
                         "Please enter a valid date.")]
            case .height:
                return [(NSPredicate.matchPredicate(regex: .height),
                         "Please enter a valid height.")]
            case .weight:
                return [(NSPredicate.matchPredicate(regex: .weight),
                         "Please enter a valid weight.")]
            }
        }
    }

    struct Error: LocalizedError, Equatable {
        let errorDescription: String?
    }

}

@Observable final class ValidatorImpl {
    
    typealias ValuesId = UserInfo.ID
    typealias isValid = Bool
    
    enum OperationType {
        case valueAdded
        case valueRemoved
    }
    
    typealias Dependencies = Any

    // MARK: - Properties
    
    private var validationDictionary: [ValuesId: isValid] = [:]
    
    // MARK: - Initialization

    init() {}
    
    // MARK: - Public implementation
    
    func setValidationValues(_ ids: [ValuesId]) {
        validationDictionary = ids.reduce(into: validationDictionary, { $0[$1] = false })
    }
    
    func areInputsValid() -> Bool {
        validationDictionary.values
            .filter { $0 == false }
            .isEmpty ? true : false
    }
    
    func validate(valuesId: ValuesId, _ type: Validation.ValidationType, input: String) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            var encounteredError = false
            if input.isEmpty {
                self.validationDictionary[valuesId] = false
                let message = Validation.Error(errorDescription: "Please enter valid" + " " + type.rawValue)
                encounteredError = true
                promise(.failure(message))
            } else {
                for (predicate, errorMessage) in type.predicates where !predicate.evaluate(with: input) {
                    self.validationDictionary[valuesId] = false
                    let message = Validation.Error(errorDescription: errorMessage)
                    encounteredError = true
                    promise(.failure(message))
                }
                if !encounteredError {
                    self.validationDictionary[valuesId] = true
                    promise(.success(()))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    // MARK: - Private implementation
    
}

// MARK: - ValidatorImpl Extension

extension ValidatorImpl {
    
    func validate(valuesId: ValuesId, _ type: Validation.ValidationType, input: Date) -> AnyPublisher<Void, Error> {
        return Future<Void, Error> { promise in
            var encounteredError = false
            for (predicate, errorMessage) in type.predicates where !predicate.evaluate(with: input) {
                self.validationDictionary[valuesId] = false
                let message = Validation.Error(errorDescription: errorMessage)
                encounteredError = true
                promise(.failure(message))
            }
            if !encounteredError {
                self.validationDictionary[valuesId] = true
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }

}
