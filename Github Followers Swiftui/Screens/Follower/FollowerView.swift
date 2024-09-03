//
//  FollowerView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct FollowerView: View {
    @ObservedObject var searchVm : SearchViewModel
    @StateObject var followerVM = FollowerViewModel()
    @ObservedObject var userInfoVM = UserInfoViewModel.shared
    let columns = [GridItem(.flexible() , spacing: 10) , GridItem(.flexible() , spacing: 10) , GridItem(.flexible())]
    let threshold = Device.screenHeight * 0.57
    @State var miny : CGFloat = 0.0
    @State var showUserDetail = false
    var body: some View {
        ZStack
        {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 30 , content: {
                    ForEach(followerVM.followers.indices , id: \.self) { i in
                        FolloweCell(follower: followerVM.followers[i])
                            .frame(height: 100)
                            .background {
                                if i == followerVM.followers.count - 1
                                {
                                    GeometryReader { geo in
                                        Color.clear
                                            .onChange(of: geo.frame(in: .global).minY) { oldValue, newValue in
                                                miny = geo.frame(in: .global).minY
                                                if newValue < threshold && followerVM.hasMoreFollowes && !followerVM.restrictExe
                                                {
                                                    print(followerVM.restrictExe)
                                                    followerVM.page += 1
                                                    followerVM.getFollowers(userName: searchVm.userName, page: followerVM.page)
                                                }
                                            }
                                    }
                                }
                            }
                            .onAppear{
                                if i == followerVM.followers.count - 1
                                {
                                    print("on appear works")
                                    followerVM.restrictExe = false
                                }
                            }
                            .onTapGesture {
                                userInfoVM.selectedUser = followerVM.followers[i]
                                showUserDetail = true
                            }
                    }
                })
                .padding(.all , 20)
            }
            
            if followerVM.viewState == .loading
            {
                GFLoadingView()
            }
            
            if followerVM.viewState == .error
            {
                GFAlert(showAlert: Binding(get: {
                    true
                }, set: { newValue in
                    followerVM.viewState = .none
                }))
            }
            
            /*if followerVM.viewState == .emptyState
            {
                Text("Empty State View Goes Here..!")
            }*/
        }
        .background(GFColors.systemBackground)
        .navigationTitle(searchVm.userName)
        .navigationBarTitleDisplayMode(.large)
        .onAppear{
            followerVM.getFollowers(userName: searchVm.userName, page: followerVM.page)
        }
        .sheet(isPresented: $showUserDetail) {
            UserInfoView(followerVM: followerVM)
        }
    }
}

#Preview {
    FollowerView(searchVm: SearchViewModel())
}
