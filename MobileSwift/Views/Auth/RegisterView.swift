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
            .font(.title)
            .padding(5)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
