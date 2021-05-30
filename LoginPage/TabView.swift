//
//  TabView.swift
//  LoginPage
//
//  Created by Bruno Brito on 30/05/21.
//

import SwiftUI

struct TabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "sparkle")
                        Text("Estimativas")
                    }
                }.tag(1)
            
            LoginPage()
                .tabItem {
                    VStack{
                        Image(systemName: "person.crop.circle.badge.checkmark")
                        Text("Estimativas")
                    }
                }.tag(2)
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
