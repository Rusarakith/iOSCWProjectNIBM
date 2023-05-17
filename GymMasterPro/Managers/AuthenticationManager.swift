//
//  AuthenticationManager.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-15.
//

import Foundation
import Firebase

struct AuthResultDataModel{
    let uid : String
    let email: String?
    let photoUrl: String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager{
    static let shared = AuthenticationManager()
    private init(){}
    
    func createUser(email: String, password: String) async throws ->AuthResultDataModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthResultDataModel(user: authDataResult.user)
    }
}
