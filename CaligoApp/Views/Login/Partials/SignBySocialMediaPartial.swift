//
//  SignBySocialMediaPartial.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 16/02/23.
//

import SwiftUI

struct SignBySocialMediaPartial: View {
    let caligoGreenColor: String
    let googleImage: String = "google"
    let facebookImage: String = "square-facebook"
    
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 40, height: 1)
                    .foregroundColor(Color(.white))
                Text("Or")
                    .foregroundColor(Color(caligoGreenColor))
                Rectangle()
                    .frame(width: 40, height: 1)
                    .foregroundColor(Color(.white))
            }
            
            HStack (spacing: 40) {
                Image(googleImage)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                    .clipped()
                    .foregroundColor(Color(caligoGreenColor))
                Image(facebookImage)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFit()
                    .clipped()
                    .foregroundColor(Color(caligoGreenColor))
            }
        }
        .padding(.top, 15)
    }
}

struct SignBySocialMediaPartial_Previews: PreviewProvider {
    static var previews: some View {
        SignBySocialMediaPartial(caligoGreenColor: "White")
            .previewLayout(.sizeThatFits)
            .background(Color.green)
    }
}
