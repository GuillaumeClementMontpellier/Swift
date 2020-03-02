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
    
    var body: some View {
        VStack{
            HStack{
                Text(pub.author)
                Spacer()
                Button(action: {}){
                    Text("...")
                }
            }
            Text(pub.titre).font(.title)
            HStack{
                Button(action: {print("plus to \(self.pub.titre)")}){
                    Image(systemName: "plus")
                }
                Text("\(pub.note)")
                Button(action: {print("minus to \(self.pub.titre)")}){
                    Image(systemName: "minus")
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        
    }
}


struct PubPreview_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
