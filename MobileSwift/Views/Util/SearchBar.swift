//
//  SearchBar.swift
//  MobileSwift
//
//  Created by user164554 on 3/2/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct SearchBar : View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search", text: $searchText)
            
            
        }.padding(10)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 5)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
