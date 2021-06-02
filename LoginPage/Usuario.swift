//
//  Usuario.swift
//  LoginPage
//
//  Created by Bruno Brito on 30/05/21.
//

import SwiftUI

struct Usuario: View {

    
    @State private var nomeCompleto = UserDefaults.standard.string(forKey: "nomeCompleto")
    @State private var profissao = UserDefaults.standard.string(forKey: "profissao")
    @State private var usuario = UserDefaults.standard.string(forKey: "usuario")
    @State private var logout: Bool = false
    
    
    //Fechar visualização do sheetview de criação de projeto
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Hello, \(usuario ?? "world")!")
                .font(.title)
                .padding()
            
            Text(String(nomeCompleto ?? "-"))
            Text(String(profissao ?? "-"))
                .padding(.bottom)
            
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
            .padding(.horizontal)
            
            
            
        }
        
        
        
        
    }
}

struct Usuario_Previews: PreviewProvider {
    static var previews: some View {
        Usuario()
    }
}
