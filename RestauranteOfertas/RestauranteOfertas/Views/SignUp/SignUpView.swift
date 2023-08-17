//
//  SignUpView.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 13/8/23.
//

import SwiftUI


struct SignUpView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var signUpViewModel: SignUpViewModel
    @EnvironmentObject private var viewRouter: ViewRouter
    
    var body: some View {
        
        ZStack { // main form
            Image("LoginBackground")
                .resizable()
                .opacity(1)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
            VStack(spacing: 10) {
                CustomBigTitle(paddingTop: 130, paddingBottom: 80, content: {
                    if signUpViewModel.userTypeForm == .Company{
                        Text("register_company_title")
                    }else{
                        Text("register_customer_title")
                    }
                })
                Spacer()
                VStack{
                    if signUpViewModel.userTypeForm == .Company{
                        CustomTextField(text: $signUpViewModel.name, fieldType: .name, leadingIcon: .User, isFieldHasError: signUpViewModel.isInvalidNameFormat)
                        CustomTextField(text: $signUpViewModel.surname, fieldType: .familyName, leadingIcon: .User, isFieldHasError: signUpViewModel.isInvalidSurnameFormat)
                        CustomTextField(text: $signUpViewModel.phone, fieldType: .telephoneNumber, leadingIcon: .Phone, isFieldHasError: signUpViewModel.isInvalidPhoneFormat)
                        
                    }
                    CustomTextField(text: $signUpViewModel.email, fieldType: .emailAddress, leadingIcon: .Message, isFieldHasError: signUpViewModel.isInvalidEmailFormat)
                    CustomTextField(text: $signUpViewModel.password, fieldType: .password, leadingIcon: .Padlock, isSecureField: true, isFieldHasError: signUpViewModel.isInvalidPasswordFormat)
                    CustomTextField(text: $signUpViewModel.passwordValidator, fieldType: .password, leadingIcon: .Padlock, isSecureField: true, isFieldHasError: signUpViewModel.isInvalidPasswordValidatorFormat)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                Button {
                    Task{
                        viewRouter.screen = .loading
                        if signUpViewModel.userTypeForm == .Company{
                            signUpViewModel.userType = .Company
                        }else{
                            signUpViewModel.userType = .Customer
                        }
                        do{
                            try await signUpViewModel.signUp()
                            
                            if signUpViewModel.userType == .Company {
                                viewRouter.tabCompany = .home
                            }else{
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
                        if signUpViewModel.userTypeForm == .Company{
                            signUpViewModel.userTypeForm = .Customer
                        }else{
                            signUpViewModel.userTypeForm = .Company
                        }
                    }
                }label: {
                    CustomUserFormChangeButtonLabel(userViewType: .Company)
                }
                .buttonStyle(ChangeUserTypeButtonStyle(color: Color("Transparent")))
            }
        }.ignoresSafeArea()
    } // end var body
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(SignUpViewModel())
    }
}
