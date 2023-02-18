//
//  SignInPartial.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 15/02/23.
//

import SwiftUI

struct SignInPartial: View {
    
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var showPassword: Bool = false
    let caligoGreenColor: Color
    let caligoSecondGreenColor: Color
    @State var emailIcon: IconComponent = IconComponent(systemIconName: "envelope", fontSizeIcon: 25, foregroundColor: Color("CaligoGreen"), attempts: 0)
    @State var lockIcon: IconComponent = IconComponent(systemIconName: "lock", fontSizeIcon: 25, foregroundColor: Color("CaligoGreen"), attempts: 0)
    
    var body: some View {
        VStack (spacing: 0) {
            HStack (alignment: .center) {
                emailIcon
                TextFieldComponent(textHint: "Enter Email Address", inputText: $emailText)
                    .onTapGesture {
                        emailIcon.foregroundColor = caligoGreenColor
                        emailIcon.attempts = 0
                        lockIcon.attempts = 0
                    }
                    .onChange(of: emailText) { _ in
                        emailIcon.foregroundColor = caligoGreenColor
                    }
            }
            .frame(height: 100)
            .padding(.horizontal)
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .foregroundColor(caligoGreenColor)
                .padding(.horizontal)
            
            HStack (alignment: .center) {
                lockIcon
                if !showPassword {
                    SecureFieldComponent(textHint: "Password", inputText: $passwordText)
                        .onTapGesture {
                            lockIcon.foregroundColor = caligoGreenColor
                            emailIcon.attempts = 0
                            lockIcon.attempts = 0
                        }
                        .onChange(of: passwordText) { _ in
                            lockIcon.foregroundColor = caligoGreenColor
                        }
                } else {
                    TextFieldComponent(textHint: "Password", inputText: $passwordText)
                        .onTapGesture {
                            lockIcon.foregroundColor = caligoGreenColor
                        }
                        .onChange(of: passwordText) { _ in
                            lockIcon.foregroundColor = caligoGreenColor
                        }
                }
                Spacer()
                Image(systemName: !showPassword ? "eye" : "eye.slash")
                    .font(.system(size: 25))
                    .foregroundColor(Color("CaligoGreen"))
                    .frame(width: 40)
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
            .frame(height: 100)
            .padding(.horizontal)
            .padding(.bottom, 25)
            
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .overlay (
            Button("LOGIN") {
                withAnimation(.default) {
                    logUser()
                }
            }
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 250, height: 50)
            .background(
                LinearGradient(
                    gradient: Gradient(colors:
                                        [
                                            caligoGreenColor,
                                            caligoSecondGreenColor
                                        ]
                                      ),
                    startPoint: .leading,
                    endPoint: .bottom)
            )
            .cornerRadius(10)
            .offset(y: 25)
            .shadow(radius: 8),
            
            alignment: .bottom
        )
        
    }
    
    func logUser() {
        if emailText.count == 0 {
            emailIcon.foregroundColor = Color.red
            emailIcon.attempts += 1
        }
        
        if passwordText.count == 0 {
            lockIcon.foregroundColor = Color.red
            lockIcon.attempts += 1
        }
        
        if emailText.count > 0 && passwordText.count > 6 {
            print("Bienvenido al login")
        }
    }
}

struct SignInPartial_Previews: PreviewProvider {
    static var previews: some View {
        SignInPartial(caligoGreenColor: Color("CaligoGreen"), caligoSecondGreenColor: Color("CaligoSecondGreen"))
            .previewLayout(.sizeThatFits)
            .background(Color("CaligoGreen"))
    }
}
