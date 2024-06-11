//
//  ViewModel.swift
//  Mediator
//
//  Created by luis fontinelles on 11/06/24.
//

import Foundation

class Controller: ObservableObject {
    
    var users: [User] = []
    
    func CreateNewUser(nome: String, email: String, senha: String) {
        let newUser = User(nome: nome, email: email, senha: senha)
        users.append(newUser)
    }
}
