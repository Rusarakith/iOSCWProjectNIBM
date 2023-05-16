//
//  UserManager.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-15.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserDataModel{
    let uid : String
    let email: String?
    let firstName: String
    let lastName: String
    let dob: String
    let age: String
    let height: String
    let weight: String
}

final class UserManager {
    
    static let shared = UserManager()
    private init(){}
    
    func createNewUser(user: UserDataModel) async throws{
        let data: [String:Any] = [
            "id" : user.uid,
            "firstName" : user.firstName,
            "lastName" : user.lastName,
            "dob" : user.dob,
            "age" : user.age,
            "height" : user.height,
            "weight" :user.weight,
            "createdOn" : Timestamp()
        ]
        
        try await Firestore.firestore().collection("User").document(user.uid).setData(data, merge: false)
    }
}
