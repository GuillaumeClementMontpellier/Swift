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
    @State var pseudo : String = ""
    @State var password : String = ""
    @State var name : String = ""
    @State var firstName : String = ""
    @State var mail : String = ""
    
    func register(){
        
        let user = User(id: "", name: name, firstname: firstName, pseudo: pseudo, mail: mail, password: password, isprivate: false, isban: false)
        
        
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
                TextField("First Name", text: $firstName)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                
                TextField("Name", text: $name)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))               .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            }.padding()
            
            HStack{
                TextField("Pseudo", text: $pseudo)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))              .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                
                SecureField("Password", text: $password)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            }.padding()
            
            HStack{
                TextField("Mail", text: $mail)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))               .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
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
