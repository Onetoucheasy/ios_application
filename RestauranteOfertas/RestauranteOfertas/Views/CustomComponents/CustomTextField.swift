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
    case Phone = "Phone"
    case User = "User"
    case Visible = "Visible"
}

struct CustomTextField : View {
    @Binding var text : String
    @State var fieldType : UITextContentType
    var leadingIcon: TextFieldIcons
    @State var trailingIcon: TextFieldIcons  = .Visible //TODO: fix
    var isSecureField: Bool = false
    var isFieldHasError = false
    @State var isFinishedEditing = false
    @FocusState private var isTextFieldFocused : Bool
    
    var body: some View{
        HStack{
            Image(leadingIcon.rawValue)
                .padding(14)
            if fieldType == .password {
                SecureField(retrievePlaceholder(), text: $text)
                    .textContentType(fieldType)
                    .foregroundColor(isFieldHasError && isFinishedEditing ? Color.red : Color.black)
                    .textInputAutocapitalization(.never)
                    .frame(minHeight: 50)
                    .font(.system(size: 18))
                    .focused($isTextFieldFocused)
                    .onChange(of: isTextFieldFocused) { newFocus in
                        isFinishedEditing = newFocus ? false : true
                    }
            }else{
                TextField(retrievePlaceholder(), text: $text)
                    .textContentType(fieldType)
                    .foregroundColor(isFieldHasError && isFinishedEditing ? Color.red : Color.black)
                    .keyboardType(.emailAddress) //TODO: is ok? refactor?
                    .textInputAutocapitalization(.never)
                    .frame(height: 50)
                    .font(.system(size: 18))
                    .focused($isTextFieldFocused)
                    .onChange(of: isTextFieldFocused) { newFocus in
                        isFinishedEditing = newFocus ? false : true
                    }
            }
            if isSecureField{
                Image(trailingIcon.rawValue)
                    .padding(14)
                    .onTapGesture {
                        if fieldType == .password {
                            self.fieldType = .jobTitle //There is no none.
                            self.trailingIcon = .Invisible
                        }else{
                            self.fieldType = .password
                            self.trailingIcon = .Visible
                        }
                    }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
        .background(Color.white)
        .padding([.leading,.trailing], 15)
    }
    
    func retrievePlaceholder() -> String{
        switch fieldType{
        case .emailAddress:
            return NSLocalizedString("email_placeholder", comment: "")
        case .password, .jobTitle:
            return NSLocalizedString("password_placeholder", comment: "")
        case .telephoneNumber:
            return NSLocalizedString("phone_placeholder", comment: "")
        case .name:
            return NSLocalizedString("name_placeholder", comment: "")
        case .familyName:
            return NSLocalizedString("surname_placeholder", comment: "")
            
        default:
            return ""
        }
    }
}

struct CustomTextField_Previews: PreviewProvider{
    static var previews: some View {
        @State  var email = ""
        CustomTextField(text: $email, fieldType: .emailAddress, leadingIcon: .Message, isFieldHasError: true)
//        CustomTextField(text: $email, placeholder: "Password", fieldType: .password, leadingIcon: .Padlock, trailingIcon: .Visible, isSecureField: true)
    }
}
