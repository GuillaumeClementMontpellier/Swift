//
//  CreatePost.swift
//  MobileSwift
//
//  Created by etud on 12/03/2020.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct CreatePost: View {
    
    @Binding var isPublication : Bool
    
    @Binding var color : Color
    
    @Binding var showMenu : Bool
    
    @State var title : String = ""
    @State var content : String = ""
    
    var cat : [String]
    
    @State var selection = 0
    
    init(isPublication: Binding<Bool>,color : Binding<Color>, showMenu : Binding<Bool>){
        self._color = color
        self._isPublication = isPublication
        self._showMenu = showMenu
        
        self.cat = ["Funny", "Serious", "Family", "Legal"]
        
        // Fetch les categories
        
    }
    
    func post(){
        
    }
    
    var body: some View {
        ScrollView{
            
            // Type Change
            HStack{
                Button(action: {withAnimation {
                    self.isPublication = true
                    self.color = Color.blue
                    }}){
                        Text("Publication")
                }
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(self.isPublication ? self.color : Color.white)
                .foregroundColor(self.isPublication ? Color.white : self.color)
                .border(self.color, width: 3)
                
                Button(action:{withAnimation {
                    self.isPublication = false
                    self.color = Color.orange
                    }}){
                        Text("Discussion")
                }
                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                .background(!self.isPublication ? self.color : Color.white)
                .foregroundColor(!self.isPublication ? Color.white : self.color)
                .border(self.color, width: 3)
                
            }.padding(.vertical)
            
            Divider()
            
            // Form
            
            HStack{
                Text("Title")
                TextField("Title", text: $title)
            }.padding()
            
            VStack(alignment: .leading){
                Text("Content")
                TextView(text: $content)
                    .frame(height: 250)
                    .cornerRadius(10)
            }.padding()
            
            if isPublication {
                Picker("Category", selection: self.$selection){
                    ForEach(0 ..< self.cat.count) {
                        Text(self.cat[$0])
                    }
                }.labelsHidden()
            }
            
            Divider()
            
            // Post
            HStack{
                
                Spacer()
                
                Button(action: self.post){
                    Text("Post")
                }
                .foregroundColor(self.color)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color.white)
                .cornerRadius(10)
                .padding(1)
                .background(self.color)
                .cornerRadius(11)
                .padding()
                
            }
            
            
            Spacer()
            
        }.navigationBarItems(
            trailing: Button(action:{
                withAnimation {
                    self.showMenu.toggle()
                }
            }
            ){
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(self.color)
            }
        )
    }
}


struct CreatePost_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
