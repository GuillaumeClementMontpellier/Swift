//
//  SwiftUIView.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showMenu: Bool
    
    @Binding var anonymous : Bool
    
    @Binding var color : Color
    
    @ObservedObject var pubSet: PublicationSet
    @ObservedObject var disSet: DiscussionSet
    
    @State var searchText = ""
    
    @State var isPublication = true {
        didSet{
            color = isPublication ? Color.blue : Color.orange
        }
    }
    
    init(color : Binding<Color>, showMenu : Binding<Bool>, anon : Binding<Bool>){
        
        self._showMenu = showMenu
        self._anonymous = anon
        
        self._color = color
        
        let pubs: [Publication] = [
            Publication(id: "", auteur: "Pinou", titre: "Pub1", contenu: "Lorem Ipsum")
        ]
        
        //let pubs: [Publication] = []
        self.pubSet = PublicationSet(pubs: pubs)
        
        let discs: [Discussion] = [
            Discussion(titre: "D1", contenu: "Lorem Ipsum", note: 550, auth: "Pinou"),
            Discussion(titre: "D2", contenu: "Lorem Ipsum", note: 20, auth: "Pinou")
        ]
        self.disSet = DiscussionSet(disc: discs)
        
        self.pubSet.getPublications()

    }
    
    var body: some View {
        
        
        ZStack{
            VStack{
                
                // Selector
                HStack{
                    Button(action: {withAnimation {
                        self.isPublication = true
                        self.color =  Color.blue
                        }}){
                            Text("Publications")
                    }
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                    .background(self.isPublication ? self.color : Color.white)
                    .foregroundColor(self.isPublication ? Color.white : self.color)
                    .border(self.color, width: 3)
                    
                    
                    Button(action:{withAnimation {
                        self.isPublication = false
                        self.color = Color.orange
                        }}){
                            Text("Discussions")
                    }
                    .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                    .background(!self.isPublication ? self.color : Color.white)
                    .foregroundColor(!self.isPublication ? Color.white : self.color)
                    .border(self.color, width: 3)
                    
                }.padding(.vertical)
                
                //Divider()
                
                SearchBar(searchText: self.$searchText)
                
                !self.isPublication ?
                    DisList(discs: self.disSet, color: self.color)
                        .padding()
                    : nil
                
                self.isPublication ?
                    PubList(pubs: self.pubSet, color : self.color, showMenu : self.$showMenu)
                        .padding()
                    : nil
                
                // End VStack
            }
            
            
            // FloatButton
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination:
                        CreatePost(
                            isPublication: self.$isPublication,
                            color: self.$color, showMenu : self.$showMenu)){
                                
                                Image(systemName: "plus")
                                    .imageScale(.large)
                                    .padding(EdgeInsets(top: 30, leading: 26, bottom: 30, trailing: 26))
                    }.background(self.color)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                }
            }
            // End GeometryReader
        }
        .navigationBarTitle(Text("Home"), displayMode : .inline)
        .navigationBarItems(
            leading: Button(action:{
                withAnimation {
                    self.showMenu.toggle()
                }
            }
            ){
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(self.color)
            },
            trailing: Button(action:{}){
                Image(systemName: "house")
                    .imageScale(.large)
                    .foregroundColor(self.color)
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
