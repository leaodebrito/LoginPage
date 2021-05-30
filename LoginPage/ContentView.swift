//
//  ContentView.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var user: User
    @State private var statusLog = UserDefaults.standard.bool(forKey: "statusLog")
    
    @State var showSheetView = false
    
    var body: some View {
        NavigationView{
            
            List{
                if user.statusLog{
                    Text("Login Realizado")
                    Text("Vamos em frente")
                }else{
                    Text("Faça seu login")
                }
            }
            .navigationTitle("Lista")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showSheetView = true
                                    }, label: {
                                        //MARK: - mudança de imagem de log
                                        if user.statusLog{
                                            Image(systemName: "person.crop.circle.badge.checkmark")
                                                .resizable()
                                                .frame(width: 35, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }else if user.statusLog == false{
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
        ContentView(user: User())
    }
}
