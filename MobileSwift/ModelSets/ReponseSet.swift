//
//  ReponseSet.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class ReponseSet: ObservableObject, Identifiable {
    
    @Published var reponses: [Reponse]
    
    init(rep: [Reponse]){
        self.reponses = rep
    }
    
    func addReponse(p: Reponse){
        self.reponses.append(p)
    }
    
    func getResponses() {
        guard let url = URL(string: "https://intense-cove-31113.herokuapp.com/comment") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                print(data)
                do {
                    let responses = try JSONDecoder().decode([Reponse].self, from: data)
                    DispatchQueue.main.async {
                        for res in responses {
                            self.addReponse(p: res)
                            print(res.commentDescription)
                        }
                    }
                    return
                } catch {
                    print(error)
                }
                
            } else {
                print("Il n'y a pas de publications !")
            }
            
        }.resume()
    }
    
}
