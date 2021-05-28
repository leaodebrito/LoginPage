//
//  LoginPage.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

struct LoginPage: View {
    
    @State var usuario: String = ""
    @State var senha: String = ""
    
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
                    print("login")
                    hideKeyboard()
                }, label: {
                    BotaoLogin(text: "Login")
                    
                })
                .padding(.top)
                .padding(.bottom, 100)
                
                
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
