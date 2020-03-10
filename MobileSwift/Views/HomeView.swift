//
//  SwiftUIView.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var showMenu: Bool = false
    
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
        let drag = DragGesture()
            .onEnded{ drag in
                if drag.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        return GeometryReader{ geometry in
            ZStack{
                VStack{
                    SearchBar(searchText: self.$searchText)
                    
                    HStack{
                        Button(action: {withAnimation {
                            self.isPublication = true
                            }}){
                                Text("Publications")
                        }
                        .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                        .background(self.isPublication ? Color.blue : Color.white)
                        .foregroundColor(self.isPublication ? Color.white : Color.orange)
                        .border(self.isPublication ? Color.blue: Color.orange, width: 3)
                        
                        Button(action:{withAnimation {
                            self.isPublication = false
                            }}){
                                Text("Discussions")
                        }
                        .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                        .background(!self.isPublication ? Color.orange : Color.white)
                        .foregroundColor(!self.isPublication ? Color.white : Color.blue)
                        .border(self.isPublication ? Color.blue: Color.orange, width: 3)
                        
                    }
                    !self.isPublication ?
                        DisList(discs: self.disSet)
                            .padding()
                        : nil
                    
                    self.isPublication ?
                        PubList(pubs: self.pubSet)
                            .padding()
                        : nil
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                .disabled(self.showMenu ? true : false)
                
                // End VStack
            }
            
            if self.showMenu {
                MenuView()
                    .frame(width: geometry.size.width / 2)
                    .transition(.move(edge: .leading))
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: EmptyView()){
                        
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .padding(EdgeInsets(top: 30, leading: 26, bottom: 30, trailing: 26))
                    }.background(self.isPublication ? Color.blue: Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                }
            }
            
            // End ZStack
        }.gesture(drag)
            .navigationBarItems(
            leading: Button(action:{
                withAnimation {
                    self.showMenu.toggle()
                }
            }
            ){
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(self.isPublication ? .blue : .orange)
            },
            trailing: Button(action:{}){
                Image(systemName: "house")
                    .imageScale(.large)
                    .foregroundColor(self.isPublication ? .blue : .orange)
            }
        )
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
