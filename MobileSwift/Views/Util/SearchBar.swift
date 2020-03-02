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
            Image(systemName: "magnifyingglass").foregroundColor(.secondary)
            
            TextField("Search", text: $searchText)
            
            //Button(action: {self.searchText = ""}) {
            //    Image(systemName: "xmark.circle.fill")
            //        .foregroundColor(.secondary)
            //        .opacity(Double(searchText == "" ? 0 : 1))
            //}
            
        }.padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
