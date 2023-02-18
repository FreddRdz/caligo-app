//
//  LoginView.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 15/02/23.
//

import SwiftUI

struct LoginView: View {
    let backgroundLoginColor: String = "Beige"
    let caligoGreenColor: Color = Color("CaligoGreen")
    let caligoSecondGreenColor: Color = Color("CaligoSecondGreen")
    let imageCaligoLogoGreen: String = "CaligoLogoGreen"
    let caligoWhiteColor: String = "White"
    @State var showSignIn: Bool = true
    @State var showSignUp: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 35) {
                Image(imageCaligoLogoGreen)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(Color(.white))
                
                HStack (spacing: 0) {
                    Button("Sign In") {
                        showSignIn = true
                        showSignUp = false
                    }
                    .padding()
                    .frame(width: 150, height: 40, alignment: .center)
                    .foregroundColor(showSignIn ? caligoGreenColor : Color(.white))
                    .background(showSignIn ? Color(.white) : caligoGreenColor)
                    .cornerRadius(20)
                    
                    Button("Sign Up") {
                        showSignUp = true
                        showSignIn = false
                    }
                    .padding()
                    .frame(width: 150, height: 40, alignment: .center)
                    .foregroundColor(showSignUp ? caligoGreenColor : Color(.white))
                    .background(showSignUp ? Color(.white) : caligoGreenColor)
                    .cornerRadius(20)
                }
                .font(.system(size: 20))
                .fontWeight(.bold)
                .background(caligoGreenColor)
                .cornerRadius(20)
                
                if showSignIn {
                    SignInPartial(caligoGreenColor: caligoGreenColor, caligoSecondGreenColor: caligoSecondGreenColor)
                } else {
                    SignUpPartial(caligoGreenColor: caligoGreenColor, caligoSecondGreenColor: caligoSecondGreenColor)
                }
                
                VStack {
                    
                    if showSignIn {
                        Button("Forgot password?") {
                            
                        }
                        .foregroundColor(Color(caligoWhiteColor))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        SignBySocialMediaPartial(caligoGreenColor: caligoWhiteColor)
                    } else {
                        SignBySocialMediaPartial(caligoGreenColor: caligoWhiteColor)
                    }
                }
            }
            // Asegurando que se vea en toda la pantalla el color Beige
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors:
                                    [caligoGreenColor, caligoSecondGreenColor]
                                  ),
                startPoint: .top,
                endPoint: .bottom)
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
