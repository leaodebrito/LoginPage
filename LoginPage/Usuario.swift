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
    
    
    //Fechar visualização do sheetview de criação de projeto
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Hello, \(usuario ?? "world")!")
            
            Button(action: {
                UserDefaults.standard.set(self.logout, forKey: "statusLog")
                
                //função que adiciona um tempo antes da realização de alguma ação
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    //Dismiss a sheet view após apertar o botão
                    presentationMode.wrappedValue.dismiss()
                })
                
                
                print("logout")
            }, label: {
                BotaoLogin(text: "Logout")
            })
            
            
            
        }
        
        
        
        
    }
}

struct Usuario_Previews: PreviewProvider {
    static var previews: some View {
        Usuario()
    }
}
