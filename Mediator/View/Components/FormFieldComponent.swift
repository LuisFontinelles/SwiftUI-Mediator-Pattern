//
//  FormFieldComponent.swift
//  Mediator
//
//  Created by luis fontinelles on 11/06/24.
//
import SwiftUI

struct FormFieldComponent: View {
    var label: String
    @Binding var value: String
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            if isSecure {
                SecureField("", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                TextField("", text: $value)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding(.bottom, 10)
    }
}
