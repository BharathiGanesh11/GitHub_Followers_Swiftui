//
//  GFAlert.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct GFAlert: View {
    @Binding var showAlert : Bool
    @State var alertTitle : String = "Alert!"
    @State var message : String = "message"
    @State var btntitle : String = "Ok"
    var body: some View {
        ZStack
        {
            let padding = Device.screenWidth * 0.1
            
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing : 20)
            {
                GFTitle(title: alertTitle)
                GFBody(title: message)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .padding(.horizontal , 20)
                
                GFButton(btnTitle: btntitle, backgroundColor: GFColors.sysPink) {
                    showAlert = false
                }
                .padding(.horizontal , 20)
            }
            .padding(.vertical,20)
            .roundedRectWithStroke(cornerRadius: 16, backgroundColor: GFColors.systemBackground, strokeColor: .white, strokeWidth: 2)
            .padding(.horizontal , padding)
        }
    }
}

#Preview {
    GFAlert(showAlert: .constant(false))
}
