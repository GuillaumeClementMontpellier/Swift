//
//  ContentView.swift
//  MobileSwift
//
//  Created by user164554 on 2/28/20.
//  Copyright © 2020 com.pinou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var color : Color  = .blue
    
    @State var showMenu : Bool = false
    
    @State var anon : Bool = false
    
    var main : some View {
        
        let drag = DragGesture()
            .onEnded{ drag in
                if drag.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
        }
        
        return GeometryReader{geometry in
            
            NavigationView{
                HomeView(color : self.$color, showMenu: self.$showMenu, anon: self.$anon)
            }.accentColor( self.color)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                .disabled(self.showMenu)
            
            // Side Menu
            if self.showMenu {
                MenuView(anonymous: self.$anon)
                    .frame(width: geometry.size.width / 2)
                    .transition(.move(edge: .leading))
            }
            
        }.gesture(drag)
        
    }
    
    var body: some View {
        self.main
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
