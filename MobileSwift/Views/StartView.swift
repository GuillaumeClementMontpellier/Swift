//
//  LoginView.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    init(){
        // TODO
        // Try to read JSon to have id : if failure, stop
        
        // Try to log in : if failure, stop
        
        // else go to HomeView
    }
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            
            NavigationLink(destination: LoginView()){
                Text("Create an Account")
            }
            .font(.largeTitle)
            .padding(EdgeInsets(
                top: 40,
                leading: 40,
                bottom: 40,
                trailing: 40))
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            
            Spacer()
            
            NavigationLink(destination: StartView()){
                Text("Login")
            }
            .foregroundColor(.blue)
            .font(.largeTitle)
            .padding(EdgeInsets(
                top: 40,
                leading: 132,
                bottom: 40,
                trailing: 132))
                .border(Color.blue, width: 3)
            
            Spacer()
            Spacer()
            
            Image(systemName: "trash")
                .font(.largeTitle)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
