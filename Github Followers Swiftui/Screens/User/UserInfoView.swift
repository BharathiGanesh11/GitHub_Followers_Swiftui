//
//  UserInfoView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 03/09/24.
//

import SwiftUI

struct UserInfoView: View {
    @ObservedObject var followerVM : FollowerViewModel
    @ObservedObject var userInfoVM = UserInfoViewModel.shared
    @Environment(\.dismiss) var dismiss
    var body: some View {
        let width = Device.screenWidth * 0.25
        NavigationStack
        {
            VStack(alignment:.leading , spacing: 20)
            {
                HStack(alignment:.center)
                {
                    //RoundedRectangle(cornerRadius: 10)
                    GFImageView(urlStr: userInfoVM.user?.avatarUrl ?? "")
                        .frame(width: width, height: width)
                    
                    VStack(alignment:.leading)
                    {
                        Text( userInfoVM.user?.login ?? "")
                            .withWeight(font: .title, foregroundColor: .primary, lineLimit: 1 , weight: .semibold)
                        
                        Text( userInfoVM.user?.name ?? "N/A")
                            .normal(font: .headline, foregroundColor: .secondary, lineLimit: 1)
                        
                        HStack
                        {
                            Image(systemName: SFSymbols.location)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.secondary)
                            
                            Text(userInfoVM.user?.location ?? "N/A")
                                .normal(font: .body, foregroundColor: .secondary, lineLimit: 1)
                        }
                        .padding(.bottom , 2)
                    }
                    .frame(height: width)
                }
                
                Text(userInfoVM.user?.bio ?? "No Bio Available")
                    .normal(font: .body, foregroundColor: .secondary, lineLimit: 3)
                
                ZStack
                {
                    GFInfoContainerView()
                    
                    VStack
                    {
                        HStack
                        {
                            GFInfoView(icon: InfoItemType.repos.icon, title: InfoItemType.repos.title, count: userInfoVM.user?.publicRepos ?? 0)
                            
                            Spacer()
                            
                            GFInfoView(icon: InfoItemType.gists.icon, title: InfoItemType.gists.title, count: userInfoVM.user?.publicGists ?? 0)
                        }
                        
                        GFButton(btnTitle: CommonWords.getProfile, backgroundColor: GFColors.sysPurple) {
                            
                        }
                    }
                    .padding(.horizontal , 12)
                }
                
                ZStack
                {
                    GFInfoContainerView()
                    
                    VStack
                    {
                        HStack
                        {
                            GFInfoView(icon: InfoItemType.following.icon, title: InfoItemType.following.title, count:  userInfoVM.user?.following ?? 0)
                            
                            Spacer()
                            
                            GFInfoView(icon: InfoItemType.followers.icon, title: InfoItemType.followers.title, count:  userInfoVM.user?.followers ?? 0)
                        }
                        
                        GFButton(btnTitle: CommonWords.getFollowers, backgroundColor: GFColors.sysGreen) {
                            
                        }
                    }
                    .padding(.horizontal , 12)
                }
                
                if let createdAt =  userInfoVM.user?.createdAt
                {
                    Text(createdAt.convertToGFDateFormat())
                        .normal(font: .body, foregroundColor: .secondary, lineLimit: 1)
                        .frame(maxWidth: .infinity , alignment: .center)
                }
                
                Spacer()
            }
            .padding(.horizontal , 20)
            .padding(.top , 20)
            .onAppear{
                userInfoVM.getUserInfo()
            }
            .overlay{
                switch userInfoVM.viewState {
                case .loading:
                    GFLoadingView()
                case .emptyState:
                    EmptyView()
                case .error:
                    GFAlert(showAlert: Binding(get: {
                        false
                    }, set: { newValue in
                        userInfoVM.viewState = .none
                    }))
                case .none:
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss.callAsFunction()
                    }
                }
            }
        }
    }
}

#Preview {
    UserInfoView(followerVM: FollowerViewModel())
}
