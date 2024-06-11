//
//  LoginView.swift
//  Mediator
//
//  Created by luis fontinelles on 11/06/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var mediator = FormMediator()
    @StateObject var controller = Controller()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                FormFieldComponent(label: "Nome", value: $mediator.name)
                FormFieldComponent(label: "Email", value: $mediator.email)
                FormFieldComponent(label: "Senha", value: $mediator.password, isSecure: true)
                
                Spacer()
                
                Text(!mediator.isFormValid ? "Preencha os campos corretamente" : "")
                    .foregroundStyle(.red)
                Button(action: {
                    controller.CreateNewUser(nome: mediator.name, email: mediator.email, senha: mediator.password)
                    print(controller.users)
                }) {
                    Text("Enviar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(mediator.isFormValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!mediator.isFormValid)
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}


struct LoginViewWithoutMediator: View {
    @StateObject var controller = Controller()
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Nome")
                    .font(.headline)
                TextField("", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("E-Mail")
                    .font(.headline)
                TextField("", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Senha")
                    .font(.headline)
                SecureField("", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Spacer()
                
                Text(name.isEmpty || password.isEmpty || email.isEmpty ? "Preencha os campos corretamente" : "")
                    .foregroundStyle(.red)
                Button(action: {
                    controller.CreateNewUser(nome: name, email: email, senha: password)
                    print(controller.users)
                }) {
                    Text("Enviar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(!name.isEmpty && !password.isEmpty && !email.isEmpty ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!name.isEmpty && !password.isEmpty && !email.isEmpty ? true : false)
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}

#Preview {
    LoginView()
//    LoginViewWithoutMediator()
}
