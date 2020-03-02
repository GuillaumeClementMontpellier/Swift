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
    
    var body: some View {
        VStack{            HStack{
                Text(disc.author)
                Spacer()
                Button(action: {}){
                    Text("...")
                }
            }
            Text(disc.titre).font(.title)
            HStack{
                Button(action: {print("plus to \(self.disc.titre)")}){
                    Image(systemName: "plus")
                }
                Text("\(disc.note)")
                Button(action: {print("minus to \(self.disc.titre)")}){
                    Image(systemName: "minus")
                }
            }.buttonStyle(BorderlessButtonStyle())
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.orange)
        
    }
}


struct DisPreview_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
