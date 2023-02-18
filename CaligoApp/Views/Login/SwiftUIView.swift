//
//  SwiftUIView.swift
//  CaligoApp
//
//  Created by Alfredo Rodriguez Coronado on 16/02/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State var attempts: Int = 0
    
    var body: some View {
        VStack {
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 200, height: 100)
                        .modifier(Shake(animatableData: CGFloat(attempts)))
                    Spacer()
                    Button(action: {
                        withAnimation(.default) {
                            self.attempts += 1
                        }

                    }, label: { Text("Login") })
                }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
