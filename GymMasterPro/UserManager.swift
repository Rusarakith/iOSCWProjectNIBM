//
//  UserManager.swift
//  GymMasterPro
//
//  Created by Rusara Kithsahan on 2023-05-15.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    
    static let shared = UserManager()
    private init(){}
    
    func createUser(data: [String : Any],uuid: String){ Firestore.firestore().collection("User").document(uuid).setData(data, merge: false)
        }
    }

