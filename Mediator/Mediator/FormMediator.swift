//
//  ContentView.swift
//  Mediator
//
//  Created by luis fontinelles on 11/06/24.
//

import SwiftUI

// Mediator
protocol FormMediatorProtocol {
    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
    var isFormValid: Bool { get set }
    func validateForm()
}

// Concrete Mediator
class FormMediator: ObservableObject, FormMediatorProtocol {
    @Published var name: String = "" {
        didSet { validateForm() }
    }
    @Published var email: String = "" {
        didSet { validateForm() }
    }
    @Published var password: String = "" {
        didSet { validateForm() }
    }
    @Published var isFormValid: Bool = false

    func validateForm() {
        isFormValid = !name.isEmpty && !email.isEmpty && !password.isEmpty && isValidEmail(email)
    }

    private func isValidEmail(_ email: String) -> Bool {
        // Simples validação de email
        return email.contains("@") && email.contains(".")
    }
}
