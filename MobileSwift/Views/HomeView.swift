//
//  SwiftUIView.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var pubSet: PublicationSet
    @ObservedObject var disSet: DiscussionSet
    
    @State var searchText = ""
    @State var isPublication = true
    
    init(){
        let pubs: [Publication] = [
            Publication(titre: "Pub1", contenu: "Lorem Ipsum", note: 500, auth: "Pinou"),
            Publication(titre: "Pub2", contenu: "Lorem Ipsum", note: 200, auth: "Pinou")
        ]
        
        self.pubSet = PublicationSet(pubs: pubs)
        
        let discs: [Discussion] = [
            Discussion(titre: "D1", contenu: "Lorem Ipsum", note: 550, auth: "Pinou"),
            Discussion(titre: "D2", contenu: "Lorem Ipsum", note: 20, auth: "Pinou")
        ]
        
        self.disSet = DiscussionSet(disc: discs)
    }
    
    var body: some View {
        VStack{
            SearchBar(searchText: $searchText)
            
            HStack{
                Button(action: {self.isPublication = true}){
                    Text("Publications")
                }
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(isPublication ? Color.blue : Color.white)
                .foregroundColor(isPublication ? Color.white : Color.orange)
                .border(isPublication ? Color.blue: Color.orange, width: 3)
                
                Button(action: {self.isPublication = false}){
                    Text("Discussions")
                }
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(!isPublication ? Color.orange : Color.white)
                .foregroundColor(!isPublication ? Color.white : Color.blue)
                .border(isPublication ? Color.blue: Color.orange, width: 3)
                
            }
            !isPublication ? DisList(discs: self.disSet) : nil
            isPublication ? PubList(pubs: self.pubSet) : nil
            
        }
        .navigationBarItems(
            leading: Button(action:{}){
                Image(systemName: "line.horizontal.3")
                    .font(.title)
            },
            trailing: Button(action:{}){
                Image(systemName: "house")
                    .font(.title)
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
