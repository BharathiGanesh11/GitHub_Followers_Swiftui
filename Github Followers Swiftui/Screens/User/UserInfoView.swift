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
    @State var showUserProfile : Bool = false
    var body: some View {
        let width = Device.screenWidth * 0.25
        NavigationStack
        {
            VStack(alignment:.leading , spacing: 20)
            {
                HStack(alignment:.center)
                {
                    if let avatarUrl = userInfoVM.user?.avatarUrl
                    {
                        GFImageView(urlStr: Binding(get: {
                            avatarUrl
                        }, set: { _ in
                            return
                        }))
                        .frame(width: width, height: width)
                    }
                    else
                    {
                        GFImageView(urlStr: Binding(get: {
                            userInfoVM.user?.avatarUrl ?? ""
                        }, set: { _ in
                            return
                        }))
                        .frame(width: width, height: width)
                    }
                    
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
                            GFInfoView(icon: InfoItemType.repos.icon, title: InfoItemType.repos.title, count: Binding(get: {
                                userInfoVM.user?.publicRepos ?? 0
                            }, set: { newValue in
                                return
                            }))
                            
                            Spacer()
                            
                            GFInfoView(icon: InfoItemType.gists.icon, title: InfoItemType.gists.title, count: Binding(get: {
                                userInfoVM.user?.publicGists ?? 0
                            }, set: { newValue in
                                return
                            }))
                        }
                        
                        GFButton(btnTitle: CommonWords.getProfile, backgroundColor: GFColors.sysPurple) {
                            showUserProfile.toggle()
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
                            GFInfoView(icon: InfoItemType.following.icon, title: InfoItemType.following.title, count:  Binding(get: {
                                userInfoVM.user?.following ?? 0
                            }, set: { newValue in
                                return
                            }))
                            
                            Spacer()
                            
                            GFInfoView(icon: InfoItemType.followers.icon, title: InfoItemType.followers.title, count:  Binding(get: {
                                userInfoVM.user?.followers ?? 0
                            }, set: { newValue in
                                return
                            }))
                        }
                        
                        GFButton(btnTitle: CommonWords.getFollowers, backgroundColor: GFColors.sysGreen) {
                            dismiss.callAsFunction()
                            followerVM.userName = userInfoVM.user?.login ?? ""
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
            .fullScreenCover(isPresented: $showUserProfile) {
                if let url = URL(string: userInfoVM.user?.htmlUrl ?? "")
                {
                    SafariView(url: url)
                }
            }
            .onAppear{
                print(userInfoVM.user)
            }
            .onDisappear{
                userInfoVM.user = nil
            }
        }
    }
}

#Preview {
    UserInfoView(followerVM: FollowerViewModel())
}
