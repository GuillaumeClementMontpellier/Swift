//
//  CreateAccountView.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var username : String = ""
    @State var password : String = ""
    
    @State var error = false
    
    func login(){
        //TODO : Try to login in : if fail, put error to true
        
        error = true
    }
    
    var body: some View {
        VStack{
            
            error ?
                Text("Wrong Username or Password")
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
            
            Button(action:self.login){
                Text("Sign in")
            }
            .font(.title)
            .padding(5)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            
            //Text(password)
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
