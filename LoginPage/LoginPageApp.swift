//
//  LoginPageApp.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

@main
struct LoginPageApp: App {
    
    @StateObject var usuario = User()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(usuario)
            
        }
    }
}
