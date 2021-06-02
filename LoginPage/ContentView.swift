//
//  ContentView.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI


let usuarioCadastrado = UserDefaults.standard.string(forKey: "usuario")
let nomeCadastrado = UserDefaults.standard.string(forKey: "nomeCompleto")
let profissaoCadastrada = UserDefaults.standard.string(forKey: "profissao")
let emailCadastrado = UserDefaults.standard.string(forKey: "email")
let senhaCadastrada = UserDefaults.standard.string(forKey: "senha")
let statusLogin = UserDefaults.standard.bool(forKey: "statusLog")


struct ContentView: View {
    
    
    @StateObject var usuario = User()
    
    @State private var statusLog = UserDefaults.standard.bool(forKey: "statusLog")
    
    @State var showSheetView = false
    
    var body: some View {
        NavigationView{
            
            List{
                if usuario.statusLog{
                    NavigationLink(destination: View1(), label: {Text("Login Realizado")})
                    NavigationLink(destination: View1(), label: {Text("Vamos em frente")})
                    Text("Vamos em frente")
                }else{
                    NavigationLink(destination: View1(), label: {Text("Faça seu login")})
                    Text("Faça seu login")
                }
            }
            .navigationTitle("Lista")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showSheetView = true
                                    }, label: {
                                        //MARK: - mudança de imagem de log
                                        if usuario.statusLog{
                                            Image(systemName: "person.crop.circle.badge.checkmark")
                                                .resizable()
                                                .frame(width: 35, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }else if usuario.statusLog == false{
                                            Image(systemName: "person.crop.circle.badge.xmark")
                                                .resizable()
                                                .frame(width: 35, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }
                                        
                                        
                                    }).sheet(isPresented: $showSheetView, content: {
                                        if statusLog{
                                            Usuario()
                                            
                                        }else if statusLog == false{
                                            LoginPage()
                                        }
                                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
