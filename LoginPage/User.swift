//
//  User.swift
//  LoginPage
//
//  Created by Bruno Brito on 30/05/21.
//

import SwiftUI
import Foundation
import Combine

class User: ObservableObject {
    
//    @Published var nome: String = UserDefaults.standard.string(forKey: "nomeCompleto") ?? "-"
//    @Published var usuario: String = UserDefaults.standard.string(forKey: "usuario") ?? "-"
//    @Published var profissao: String = UserDefaults.standard.string(forKey: "profissao") ?? "-"
//    @Published var email: String = UserDefaults.standard.string(forKey: "e-mail") ?? "-"
//    @Published var senha: String = UserDefaults.standard.string(forKey: "senha") ?? "-"
//    @Published var statusLog: Bool = UserDefaults.standard.bool(forKey: "statusLog")
    
    @Published var nome: String{
        didSet{
            UserDefaults.standard.set(nome, forKey: "nomeCompleto")
        }
    }
    
    @Published var usuario: String{
        didSet{
            UserDefaults.standard.set(usuario, forKey: "usuario")
        }
    }
    
    @Published var profissao: String{
        didSet{
            UserDefaults.standard.set(profissao, forKey: "profissao")
        }
    }
    
    @Published var email: String{
        didSet{
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    

    @Published var senha: String{
        didSet{
            UserDefaults.standard.set(senha, forKey: "senha")
        }
    }
    
    @Published var statusLog: Bool{
        didSet{
            UserDefaults.standard.set(statusLog, forKey: "statusLog")
        }
    }
    
    
    init(){
        self.nome = UserDefaults.standard.object(forKey: "nomeCompleto") as? String ?? ""
        self.usuario = UserDefaults.standard.object(forKey: "usuario")  as? String ?? ""
        self.profissao = UserDefaults.standard.object(forKey: "profissao")  as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? ""
        self.senha = UserDefaults.standard.object(forKey: "senha")  as? String ?? ""
        self.statusLog = UserDefaults.standard.object(forKey: "statusLog") as? Bool ?? false
    }
    
    

    
}
