//
//  Registrate.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

struct Registrate: View {
    
    @State var usuario: String = ""
    @State var profissao: String = ""
    @State var email: String = ""
    @State var senha: String = ""
    
    
    
    var body: some View {
        VStack{
            Text("Preencha os campos abaixo")
                .font(.title)
                .bold()
            
            Group{
                TextField("Usuário", text: $usuario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 6)
                
                TextField("Profissão", text: $profissao)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 6)
                
                TextField("E-mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 6)
                
                SecureField("Senha", text: $senha)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            //Botão para fazer o login
            Button(action: {
                print("login")
                hideKeyboard()
            }, label: {
                BotaoLogin(text: "Cadastrar")
                
            })
            .padding(.top)
            .padding(.bottom, 100)
            
            
            
        }
        .padding(.horizontal)
    }
}

struct Registrate_Previews: PreviewProvider {
    static var previews: some View {
        Registrate()
    }
}
