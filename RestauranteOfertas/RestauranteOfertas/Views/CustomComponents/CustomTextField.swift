//
//  CustomTextField.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 14/8/23.
//

import SwiftUI
enum TextFieldIcons : String{
    case Invisible = "Invisible"
    case Message = "Message"
    case Padlock = "Padlock"
    case User = "User"
    case Visible = "Visible"
}
struct CustomTextField : View {
    var textField: TextField<Text>
    var iconName: TextFieldIcons
    var body: some View{
        HStack{
            Image(iconName.rawValue)
                .padding(14)
            textField
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .frame(height: 50)
                .font(.system(size: 18))
        }
        
        .background(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(Color.black, lineWidth: 1)
               )
        .background(Color.white)
        .padding([.leading,.trailing], 15)
    }
}

struct CustomTextField_Previews: PreviewProvider{
    static var previews: some View {
        @State  var email = ""
        CustomTextField(textField: TextField("Email", text: $email), iconName: .Message)
    }
}
