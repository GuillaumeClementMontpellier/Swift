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
    
    var color : Color
    
    @State var active = false
    
    func plus(){
        
    }
    
    func dot(){
        
    }
    
    var body: some View {
        NavigationLink(destination: DiscDetail(dis: disc)){
            VStack{
                
                HStack{
                    Text(disc.author)
                    Spacer()
                    Button(action: {}){
                        Text("...")
                    }
                }
                
                Divider()
                HStack{
                    Text("\(disc.note)")
                    Button(action: {}){
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    
                    Divider()
                    
                    Text(disc.titre).font(.title)
                    
                    Spacer()
                    
                }
                
                
            }
            .padding()
            .foregroundColor(.white)
            .background(self.color)
            .cornerRadius(20)
        }
    }
}


struct DisPreview_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
