//
//  PubPreview.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct PubPreview: View {
    var pub : Publication
    
    @State var active = false
    
    var body: some View {
        VStack{
            NavigationLink(destination: PubDetail(pub: pub), isActive: $active){EmptyView()}
            
            HStack{
                Text(pub.author)
                
                Spacer()
                
                Button(action: {}){
                    Text("...")
                    // Menu deroulant : Signaler ou s'abonner
                }
            }
            Text(pub.titre).font(.title)
            HStack{
                Button(action: {}){
                    Image(systemName: "plus")
                }
                Text("\(pub.note)")
                Button(action: {}){
                    Image(systemName: "minus")
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .onTapGesture {
            self.active = true
        }
        
    }
    
}


struct PubPreview_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
