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
                    CustomTextField(text: $signUpViewModel.name, fieldType: .name, leadingIcon: .User, isFieldHasError: signUpViewModel.isInvalidNameFormat).id(4)
                    if signUpViewModel.userTypeForm == .Company{
                        CustomTextField(text: $signUpViewModel.surname, fieldType: .familyName, leadingIcon: .User, isFieldHasError: signUpViewModel.isInvalidSurnameFormat).id(5)
                        CustomTextField(text: $signUpViewModel.phone, fieldType: .telephoneNumber, leadingIcon: .Phone, isFieldHasError: signUpViewModel.isInvalidPhoneFormat).id(6)
                        
                    }
                    CustomTextField(text: $signUpViewModel.email, fieldType: .emailAddress, leadingIcon: .Message, isFieldHasError: signUpViewModel.isInvalidEmailFormat).id(7)
                    CustomTextField(text: $signUpViewModel.password, fieldType: .password, leadingIcon: .Padlock, isSecureField: true, isFieldHasError: signUpViewModel.isInvalidPasswordFormat).id(8)
                    CustomTextField(text: $signUpViewModel.passwordValidator, fieldType: .password, leadingIcon: .Padlock, isSecureField: true, isFieldHasError: signUpViewModel.isInvalidPasswordValidatorFormat).id(9)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                Button {
                    Task{
                       // viewRouter.screen = .loading
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
                            signUpViewModel.showAlert = true
                            print(error)
                            print("Registation failed. Check user and password")
                        }
                    }
                } label: {
                    Text("register")
                        .font(.title2)
                }
                .disabled(!signUpViewModel.signUpFormIsComplete)
                .buttonStyle(MainButtonStyle(color: Color("MainYellow")))
                .alert(isPresented: $signUpViewModel.showAlert) {
                    Alert(title: Text("register_alert_title"), message: Text("register_alert_body"), dismissButton: .default(Text("login_alert_ok")))
                }.id(10)
                
                    
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
                .id(11)
            }
        }.ignoresSafeArea()
    } // end var body
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(SignUpViewModel())
    }
}
