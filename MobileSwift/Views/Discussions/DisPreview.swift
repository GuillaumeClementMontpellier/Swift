//
//  DisPreview.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct DisPreview: View {
    var disc : Discussion
    
    @State var active = false
    
    var body: some View {
        VStack{
            NavigationLink(destination: DiscDetail(dis: disc), isActive: $active){EmptyView()}
            
            HStack{
                Text(disc.author)
                Spacer()
                Button(action: {}){
                    Text("...")
                }
            }
            Text(disc.titre).font(.title)
            HStack{
                Button(action: {}){
                    Image(systemName: "plus")
                }
                Text("\(disc.note)")
                Button(action: {}){
                    Image(systemName: "minus")
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.orange)
        .onTapGesture {
            self.active = true
        }
        
    }
}


struct DisPreview_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
