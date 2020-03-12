//
//  RegisterView.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State var error = false
    @State var username : String = ""
    @State var password : String = ""
    
    func register(){
        // TODO
        
        error = true
    }
    
    var body: some View {
        VStack{
            
            Text("Create an Account")
                .font(.largeTitle)
            
            error ?
                Text("Error")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                : nil
            
            HStack{
                Text("Username")
                TextField("Username", text: $username)
            }.padding()
            
            HStack{
                Text("Password")
                SecureField("Password", text: $password)
            }.padding()
            
            Button(action:self.register){
                Text("Register")
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
