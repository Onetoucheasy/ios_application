//
//  SignUpView.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 13/8/23.
//

import SwiftUI


struct SignUpView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var rootViewModel: LoginViewModel
    @EnvironmentObject private var viewRouter: ViewRouter
    @State private var email = ""
    @State private var password = ""
    @State private var passwordValidator = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var phone = ""
    @State var isCompanyForm = true
    @State var userType: UserType = .Customer
    var body: some View {
        
        ZStack { // main form
            Image("LoginBackground")
                .resizable()
                .opacity(1)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
            VStack(spacing: 10) {
                CustomBigTitle(paddingTop: 130, paddingBottom: 80, content: {
                    if isCompanyForm{
                        Text("register_company_title")
                    }else{
                        Text("register_customer_title")
                    }
                })
                Spacer()
                VStack{
                    if isCompanyForm{
                        CustomTextField(textField: TextField("register_name_placeholder", text: $name), iconName: .User)
                        CustomTextField(textField: TextField("register_surname_placeholder", text: $surname), iconName: .User)
                        CustomTextField(textField: TextField("register_phone_placeholder", text: $phone), iconName: .User)//TODO: add phone icon
                    }
                                    
                    CustomTextField(textField: TextField("register_email_placeholder", text: $email), iconName: .Message)
                    
                    CustomSecureField(secureTextField: SecureField("register_password_placeholder", text: $password), leadingIconName: .Padlock, trailingIconName: .Visible)
                    CustomSecureField(secureTextField: SecureField("register_password_validator_placeholder", text: $passwordValidator), leadingIconName: .Padlock, trailingIconName: .Visible)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                Button {
                    Task{
                        viewRouter.screen = .loading
                        if isCompanyForm{
                            userType = .Company
                        }else{
                            userType = .Customer
                        }
                        do{
                            try await rootViewModel.signUp(email: email, password: password, passwordValidator: passwordValidator, userType: userType.rawValue)

                            if rootViewModel.isCompany {
                              //  viewRouter.screen = .tabs
                                viewRouter.tabCompany = .home
                            }else{
                              //  viewRouter.screen = .tabs
                                viewRouter.tabCustomer = .home
                            }
                            viewRouter.screen = .tabs

                        }catch{
                            print(error)
                            print("Registation failed. Check user and password")
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
                Spacer()
                Button{
                    withAnimation {
                        isCompanyForm.toggle()
                    }
                }label: {
                    CustomUserFormChangeButtonLabel(userViewType: .Company) //TODO: refactor, formType instead of user type (user hasn't sign in yet.
                }
                .buttonStyle(ChangeUserTypeButtonStyle(color: Color("Transparent")))
            }
        }.ignoresSafeArea()
    } // end var body
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isCompanyForm: true)
    }
}
