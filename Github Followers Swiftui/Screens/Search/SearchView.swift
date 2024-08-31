//
//  SearchView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchVM = SearchViewModel()
    @State var showAlert = false
    var body: some View {
        NavigationStack {
            VStack(spacing:40)
            {
                let width = Device.screenWidth * 0.55
                let padding = Device.screenWidth * 0.1
                
                Images.logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: width)
                    .padding(.top , padding)
                
                Group
                {
                    GFTextField(placeHolder: CommonWords.enterUserName, value: $searchVM.userName)
                    
                    Spacer()
                    
                    GFButton(btnTitle: CommonWords.getFollowers, backgroundColor: GFColors.sysGreen) {
                        if !isUserNameEntered
                        {
                            showAlert = true
                        }
                        else
                        {
                            searchVM.showFollowerView = true
                        }
                    }
                    .padding(.bottom , padding)
                }
                .padding(.horizontal , padding)
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $searchVM.showFollowerView) {
                FollowerView(searchVm: searchVM)
            }
            .overlay {
                if showAlert
                {
                    GFAlert(showAlert: $showAlert , message: CommonWords.plsEnterUserNameToSearch)
                }
            }
        }
    }
    
    var isUserNameEntered : Bool
    {
        return !searchVM.userName.isEmpty
    }
}

#Preview {
    SearchView()
}
