//
//  User.swift
//  MobileSwift
//
//  Created by user164554 on 4/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation


class User: Identifiable, Codable {
    
    let id = UUID()
    var userName: String
    var userFirstName: String
    var userPseudo: String
    var userMail: String
    var userPassword: String
    var isPrivate: Bool
    var isBan: Bool
    static var allUsers : [User] = []
    
    init(name: String, firstname: String, pseudo: String, mail: String, password: String, isprivate: Bool, isban: Bool) {
        self.userName = name
        self.userFirstName = firstname
        self.userPseudo = pseudo
        self.userMail = mail
        self.userPassword = password
        self.isPrivate = isprivate
        self.isBan = isban
    }
    
    static func getUser(id: UUID) -> User {
        for user in allUsers {
            if id == user.id {
                return user
            }
        }
        return User(name: "", firstname: "", pseudo: "Anonymous", mail: "", password: "", isprivate: true, isban: false)
    }
    
    static func createUser(id: UUID) {
        guard let url = URL(string: "https://intense-cove-31113.herokuapp.com/users/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                print(data)
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        User.allUsers.append(User(name: user.userName, firstname: user.userFirstName, pseudo: user.userPseudo, mail: user.userMail, password: user.userPassword, isprivate: user.isPrivate, isban: user.isBan))
                    }
                    return
                } else {
                    print("Erreur")
                }
            }
            print("Il n'y a pas de user avec cet id !")
        }.resume()
    }
}

