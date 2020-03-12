//
//  MenuView.swift
//  MobileSwift
//
//  Created by etud on 10/03/2020.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var anonymous : Bool
    
    var body: some View {
        VStack{
            
            HStack {
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                
            }.padding(.top, 100)
            
            
            Toggle(isOn: self.$anonymous){
                Text("Anonymous Posting")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            
            HStack {
                
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                
            }.padding(.top, 30)
            
            Spacer()
            
        }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
