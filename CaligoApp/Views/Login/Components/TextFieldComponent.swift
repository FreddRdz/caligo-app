//
//  TextFieldComponent.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 16/02/23.
//

import SwiftUI

struct TextFieldComponent: View {
    let textHint: String
    @Binding var inputText: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if inputText.isEmpty {
                Text(textHint)
                    .foregroundColor(.gray.opacity(0.6))
                    .font(.title3)
            }
            TextField("", text: $inputText)
                .foregroundColor(.black)
                .font(.title3)
                .disableAutocorrection(true)
                .autocapitalization(.none)
        }
        
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    @State static var emailText: String = ""

    static var previews: some View {
        TextFieldComponent(textHint: "Enter Email Address", inputText: $emailText)
    }
}
