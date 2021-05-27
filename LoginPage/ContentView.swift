//
//  ContentView.swift
//  LoginPage
//
//  Created by Bruno Brito on 27/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheetView = false
    
    var body: some View {
        NavigationView{
            List{
                Text("Placeholder 1")
                Text("Placeholder 2")
                Text("Placeholder 3")
            }
            .navigationTitle("Lista")
            .navigationBarItems(trailing:
                Button(action: {
                    showSheetView = true
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }).sheet(isPresented: $showSheetView, content: {
                    LoginPage()
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
