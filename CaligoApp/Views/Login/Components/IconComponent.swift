//
//  IconComponent.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 16/02/23.
//

import SwiftUI

struct IconComponent: View {
    let systemIconName: String
    let fontSizeIcon: CGFloat
    var foregroundColor: Color
    var attempts: Int
    
    var body: some View {
        Image(systemName: systemIconName)
            .font(.system(size: fontSizeIcon))
            .foregroundColor(foregroundColor)
            .frame(width: 40)
            .modifier(Shake(animatableData: CGFloat(attempts)))
    }
}

struct IconComponent_Previews: PreviewProvider {
    static var previews: some View {
        IconComponent(systemIconName: "envelope", fontSizeIcon: 25, foregroundColor: Color("CaligoGreen"), attempts: 0)
    }
}
