//
//  Registrate.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

struct Registrate: View {
    

    @State var nomeCompleto: String = ""
    @State var usuario: String = ""
    @State var profissao: String = ""
    @State var email: String = ""
    @State var senha: String = ""
    @State var statusLog: Bool = false
    
    
    
    var body: some View {
        VStack{
            Text("Preencha os campos abaixo")
                .font(.title)
                .bold()
            
            Group{
                
                TextField("Nome Completo", text: $nomeCompleto)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 6)
                
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
                
                self.statusLog = true
                
                UserDefaults.standard.set(self.nomeCompleto, forKey: "nomeCompleto")
                UserDefaults.standard.set(self.usuario, forKey: "usuario")
                UserDefaults.standard.set(self.profissao, forKey: "profissao")
                UserDefaults.standard.set(self.email, forKey: "e-mail")
                UserDefaults.standard.set(self.senha, forKey: "senha")
                UserDefaults.standard.set(self.statusLog, forKey: "statusLog")
                
            }, label: {
                BotaoLogin(text: "Cadastrar")
                
            })
            .onAppear{
                UserDefaults.standard.set(self.nomeCompleto, forKey: "nomeCompleto")
                UserDefaults.standard.set(self.usuario, forKey: "usuario")
                UserDefaults.standard.set(self.profissao, forKey: "profissao")
                UserDefaults.standard.set(self.email, forKey: "e-mail")
                UserDefaults.standard.set(self.senha, forKey: "senha")
                UserDefaults.standard.set(self.statusLog, forKey: "statusLog")
            }
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
