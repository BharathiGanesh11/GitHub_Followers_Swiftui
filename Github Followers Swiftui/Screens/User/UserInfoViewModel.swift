//
//  UserInfoViewModel.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 03/09/24.
//

import Foundation

class UserInfoViewModel : ObservableObject
{
    static let shared = UserInfoViewModel()
    private init(){}
    @Published var viewState : ViewState = .none
    @Published var selectedUser : Follower = Follower(login: "", avatarUrl: "")
    @Published var user : User? = nil
    
    func getUserInfo()
    {
        print(selectedUser.login)
        viewState = .loading
        GFNetworkManager.shared.getUserInfo(userName: selectedUser.login) { [weak self] result in
           
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.viewState = .none
            }
            switch result {
            case .success(let userInfo):
                print(userInfo)
                DispatchQueue.main.async {
                    self.user = userInfo
                    self.viewState = .none
                }
            case .failure(let error):
                viewState = .error
            }
        }
    }
}
