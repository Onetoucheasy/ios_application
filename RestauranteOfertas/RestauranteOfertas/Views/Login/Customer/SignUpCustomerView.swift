//
//  SignUpCustomerView.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 13/8/23.
//

import SwiftUI

struct SignUpFormView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var rootViewModel: LoginViewModel // remove?
    @EnvironmentObject private var viewRouter: ViewRouter
    @State private var email = ""
    @State private var password = ""
    @State private var passwordValidator = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var phone = ""
    @State private var showLogin = ""
    //@FocusState private var textFieldEmailFocused: Bool
    //@FocusState private var textFieldPasswordFocused: Bool
    @State var isCompanyForm = false

    var body: some View {
        
        ZStack { // main form
            Image("LoginBackground")
                .resizable()
                .opacity(1)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
            VStack(spacing: 15) { // email & password text fields
                CustomTitle{
                    if isCompanyForm{
                        Text("register_company_title")
                    }else{
                        Text("register_customer_title")
                    }
                }                             
                if isCompanyForm{
                    CustomTextField(textField: TextField("register_name_placeholder", text: $name), iconName: .User)
                    CustomTextField(textField: TextField("register_surname_placeholder", text: $surname), iconName: .User)
                    CustomTextField(textField: TextField("register_phone_placeholder", text: $phone), iconName: .User)
                }
                                
                CustomTextField(textField: TextField("register_email_placeholder", text: $email), iconName: .Message)
                
                CustomSecureField(secureTextField: SecureField("register_password_placeholder", text: $password), leadingIconName: .Padlock, trailingIconName: .Visible)
                CustomSecureField(secureTextField: SecureField("register_password_validator_placeholder", text: $passwordValidator), leadingIconName: .Padlock, trailingIconName: .Visible)
                
                Button {
                    Task{
                        viewRouter.screen = .loading //TODO: The login is too fast that is hard to notice.
                        do{
                            try await rootViewModel.signIn(email: email, password: password)

                            if rootViewModel.isCompany {
                              //  viewRouter.screen = .tabs
                                viewRouter.tabCustomer = .home
                            }else{
                              //  viewRouter.screen = .tabs
                                viewRouter.tabCustomer = .home
                            }
                            viewRouter.screen = .tabs

                        }catch{
                            print(error)
                            print("Registation failed. Check user and password") //TODO: Localization
                         //   viewRouter.screen = .signIn //TODO: it does not save the texbox data.
                        }
                    }
                } label: {
                    Text("register")
                        .font(.title2)
                }
                .buttonStyle(MainButtonStyle(color: Color("MainYellow")))
                
                
                Button {
                    viewRouter.screen = .signIn
                } label: {
                    Text("register_already_account")
                        .font(.subheadline) //TODO: Check
                }
                .buttonStyle(TransparentButtonStyle(color: Color("Transparent")))
               
                
            }
        }.ignoresSafeArea()
    } // end var body
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(isCompanyForm: true)
    }
}
