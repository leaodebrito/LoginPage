//
//  User.swift
//  LoginPage
//
//  Created by Bruno Brito on 30/05/21.
//

import SwiftUI

class User: ObservableObject{
    
    @Published var nome: String = UserDefaults.standard.string(forKey: "nomeCompleto") ?? "-"
    @Published var usuario: String = UserDefaults.standard.string(forKey: "usuario") ?? "-"
    @Published var profissao: String = UserDefaults.standard.string(forKey: "profissao") ?? "-"
    @Published var email: String = UserDefaults.standard.string(forKey: "e-mail") ?? "-"
    @Published var senha: String = UserDefaults.standard.string(forKey: "senha") ?? "-"
    @Published var statusLog: Bool = UserDefaults.standard.bool(forKey: "statusLog")
    
}
