//
//  SecureFieldComponent.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 16/02/23.
//

import SwiftUI

struct SecureFieldComponent: View {
    let textHint: String
    @Binding var inputText: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if inputText.isEmpty {
                Text(textHint)
                    .foregroundColor(.gray.opacity(0.6))
                    .font(.title3)
            }
            SecureField("", text: $inputText)
                .foregroundColor(.black)
                .font(.title3)
                .disableAutocorrection(true)
        }
        
    }
}

struct SecureFieldComponent_Previews: PreviewProvider {
    @State static var password: String = ""
    
    static var previews: some View {
        SecureFieldComponent(textHint: "Password", inputText: $password)
    }
}
