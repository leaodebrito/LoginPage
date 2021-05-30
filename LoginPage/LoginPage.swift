//
//  LoginPage.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

struct LoginPage: View {
    
    //Varias dos textfields para validação do login
    @State var usuario: String = ""
    @State var senha: String = ""
    
    //Retorna os valores cadastrados no UserDefaults
    @State private var usuarioCadastrado = UserDefaults.standard.string(forKey: "usuario")
    @State private var senhaCadastrada = UserDefaults.standard.string(forKey: "senha")
    
    //Bool para validação do login
    @State var loginCerto: Bool = true
    @State var loginErrado: Bool = false

    //Bool para notificações
    @State var notificacoes: Bool = false
    
    
    //Fechar visualização do sheetview de criação de projeto
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Faça seu login")
                    .font(.title)
                    .bold()
                
                //MARK: - Fazer Login
                Group{
                    TextField("Usuário", text: $usuario)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 6)
                    
                    SecureField("Senha", text: $senha)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                
                
                
                //Botão para fazer o login
                Button(action: {
                    //MARK: - Condicional para validação do login
                    ///Esse bloco de código fazer comparação lógica dos valores armazenados no UserDefaults com os valores de entrada dos textfields
                    if self.usuario == usuarioCadastrado && self.senha == senhaCadastrada{
                        //Mudança da flag de statusLog para verdadeiro
                        UserDefaults.standard.set(self.loginCerto, forKey: "statusLog")
                        print("login realizado")
                        
                        //função que adiciona um tempo antes da realização de alguma ação
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            //Dismiss a sheet view após apertar o botão
                            presentationMode.wrappedValue.dismiss()
                        })
                        
                        notificacoes.toggle()
                        
                    }else{
                        UserDefaults.standard.set(self.loginErrado, forKey: "statusLog")
                        print("login não realizado")
                    }
                    
                    hideKeyboard()
                    print("apertaram o botão")
                    
                }, label: {
                    BotaoLogin(text: "Login")
                    
                })
                .padding(.top)
                .padding(.bottom, 100)
                
                if notificacoes{
                    Group{
                        Text("Login Realizado com Sucesso")
                            .bold()
                            .foregroundColor(.red)
                            .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: 40, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal)
                            
                    }
                    .padding(.bottom)
                }
                
                
                //MARK: - Cadastrar
                Text("Não tem login ainda?")
                    .font(.title3)
                    .bold()
                HStack{
                    Text("Faça seu cadastro com a gente")
                        .font(.title3)
                    
                    Spacer()
                    NavigationLink(
                        destination: Registrate(),
                        label: {
                            Image(systemName: "person.crop.circle.badge.plus")
                                .resizable()
                                .frame(width: 35, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    
                    
                    Spacer()
                }
                
                
                
            }
            .padding()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}


struct BotaoLogin: View{
    
    @State var text: String
    
    var body: some View{
        
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .bold()
        }
        
    }
}

//Dispensa o teclado ao apertar determinado botão
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
