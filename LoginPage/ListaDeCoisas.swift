//
//  ListaDeCoisas.swift
//  LoginPage
//
//  Created by Bruno Brito on 30/05/21.
//

import SwiftUI

struct ListaDeCoisas: View {
    
    
    @State private var statusLog = UserDefaults.standard.bool(forKey: "statusLog")
    
    @State var showSheetView = false
    
    var body: some View {
        NavigationView{
            
            List{
                if statusLog{
                    Text("Login Realizado")
                    Text("Vamos em frente")
                }else if statusLog == false{
                    Text("Faça seu login")
                }
            }
            .navigationTitle("Lista")

        }
    }
}

struct ListaDeCoisas_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeCoisas()
    }
}
