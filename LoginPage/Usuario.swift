//
//  Usuario.swift
//  LoginPage
//
//  Created by Bruno Brito on 30/05/21.
//

import SwiftUI

struct Usuario: View {
    
    @State private var usuario = UserDefaults.standard.string(forKey: "nomeCompleto")
    @State private var logout: Bool = false
    
    var body: some View {
        VStack{
            Text("Hello, \(usuario ?? "world")!")
            
            Button(action: {
                UserDefaults.standard.set(self.logout, forKey: "statusLog")
                print("logout")
            }, label: {
                BotaoLogin(text: "Logout")
            }).onDisappear(perform:{
                UserDefaults.standard.set(self.logout, forKey: "statusLog")
            })
            
            
            
        }
        
        
        
        
    }
}

struct Usuario_Previews: PreviewProvider {
    static var previews: some View {
        Usuario()
    }
}
