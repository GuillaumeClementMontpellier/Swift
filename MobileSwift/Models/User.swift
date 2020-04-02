//
//  User.swift
//  MobileSwift
//
//  Created by user164554 on 4/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation


class User: Identifiable, Codable {
    
    var _id: String
    var userName: String
    var userFirstName: String
    var userPseudo: String
    var userMail: String
    var userPassword: String
    var isPrivate: Bool
    var isBan: Bool
    var userToken: String
    static var allUsers : [User] = []
    
    init(id: String, name: String, firstname: String, pseudo: String, mail: String, password: String, isprivate: Bool, isban: Bool) {
        self._id = id
        self.userName = name
        self.userFirstName = firstname
        self.userPseudo = pseudo
        self.userMail = mail
        self.userPassword = password
        self.isPrivate = isprivate
        self.isBan = isban
        self.userToken = ""
    }
    
    static func getUser(id: String) -> User {
        for user in allUsers {
            if id == user._id {
                return user
            }
        }
        return User(id: "", name: "", firstname: "", pseudo: "Anonymous", mail: "", password: "", isprivate: true, isban: false)
    }
    
    static func createUser(id: String) {
        guard let url = URL(string: "https://intense-cove-31113.herokuapp.com/users/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                print(data)
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    print(user)
                    DispatchQueue.main.async {
                        User.allUsers.append(User(id: user._id, name: user.userName, firstname: user.userFirstName, pseudo: user.userPseudo, mail: user.userMail, password: user.userPassword, isprivate: user.isPrivate, isban: user.isBan))
                        print(user.userName)
                    }
                    return
                }
                catch DecodingError.dataCorrupted(let erreur) {
                    print(erreur)
                } catch {
                    print(error)
                }
                
                
            } else {
                print("Il n'y a pas de user avec cet id !")
            }
        }.resume()
    }
    
    func saveUser(user: User) {
        guard let data = try? JSONEncoder().encode(user) else {
            fatalError("can't encode to Json")
        }
        
        if let url = URL(string: "https://intense-cove-31113.herokuapp.com/register") {
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = data
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let httpRes = response as? HTTPURLResponse,
                    (200...299).contains(httpRes.statusCode)
                else {
                    print(response!)
                    return
                }
            
                if let error = error {
                    print(error.localizedDescription)
                }
                
                guard let content = data else {
                    print("there is no data")
                    return
                }
                
                DispatchQueue.main.async {
                    do {
                        let user : User = try JSONDecoder().decode(User.self, from: content)
                        if let token = httpRes.value(forHTTPHeaderField: "auth-token") {
                            user.userToken = token
                        }
                    } catch {
                        print(error)
                    }
                }
            
            }.resume()
        }
    }
    
    
    
}

