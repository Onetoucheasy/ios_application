//
//  FilterButtonComponent.swift
//  RestauranteOfertas
//
//  Created by Enrique Poyato Ortiz on 4/8/23.
//

import SwiftUI

struct FilterButtonComponent: View {
    var action: () -> Void
    var title: String
    var body: some View {
        Button{
            action()
        }label: {
            Text(title)
        }
        .buttonStyle(.plain)
        .padding(.vertical, 5)
        .padding(.horizontal, 25)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
        )
        .background(
            RoundedRectangle(cornerRadius: 15).fill(Color(hex: 0xFBDB6C))
        )
        .frame(maxWidth: .infinity)
    }
}

struct FilterButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonComponent(action: {}, title: "Activo")
    }
}
