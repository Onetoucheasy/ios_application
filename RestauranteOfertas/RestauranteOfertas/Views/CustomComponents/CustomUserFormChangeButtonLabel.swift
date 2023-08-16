//
//  CustomUserTypeButtonLabel.swift
//  RestauranteOfertas
//
//  Created by Alberto Junquera Ramírez on 16/8/23.
//

import SwiftUI
enum UserType: String{
    case Admin = "Admin"
    case Company = "Company"
    case Customer = "Customer"
}
//A Company user, can see the Customer's view but not the other way around.
enum UserViewType{
    case Admin
    case Company
    case Customer
}
struct CustomUserFormChangeButtonLabel : View {
    var userViewType: UserViewType

    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Text("register_access")
                    .font(.title3)
                if userViewType == .Company{
                    Image(.Crown)
                }else{
                    Image(.Crown).hidden() //Added to avoid the shrink of the layout
                }
                Image(systemName: "arrow.right")
                    .font(.title3)
            }
            HStack {
                
                Text(getStringResource(for: userViewType))
                    .font(.title3)
            }
        }
    }
    
    private func getStringResource(for userViewType: UserViewType) -> String{
        var userTypeString : String {
            switch userViewType{
            case .Admin:
                 return NSLocalizedString("user_type_admin", comment: "")
            case .Company:
                 return NSLocalizedString("user_type_company", comment: "")
            case .Customer:
                 return NSLocalizedString("user_type_customer", comment: "")
            }
        }
        return userTypeString
    }
}

struct CustomUserTypeButtonLabel_Previews: PreviewProvider{
    static var previews: some View {
        CustomUserFormChangeButtonLabel(userViewType: .Company)
    }
}

