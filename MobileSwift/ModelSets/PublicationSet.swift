//
//  PublicationSet.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import Foundation

class PublicationSet: ObservableObject, Identifiable {
    
    @Published var publications: [Publication]
    
    init(pubs: [Publication]){
        self.publications = pubs
    }
        
    func addPublication(p: Publication){
        self.publications.append(p)
    }
    
    func getPublications() {
        guard let url = URL(string: "https://intense-cove-31113.herokuapp.com/publications") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                print(data)
                do {
                    let publications = try JSONDecoder().decode([Publication].self, from: data)
                    DispatchQueue.main.async {
                        for pub in publications {
                            self.addPublication(p: pub)
                            print(pub.publicationTitle)
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

