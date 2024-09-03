//
//  FollowerViewModel.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 01/09/24.
//

import SwiftUI

enum ViewState
{
    case loading
    case emptyState
    case error
    case none
}

class FollowerViewModel : ObservableObject {
    @Published var followers : [Follower] = []
    @Published var viewState : ViewState = .none
    var page = 1
    var hasMoreFollowes : Bool = true
    var isFiltered : Bool = false
    
    @Published var restrictExe : Bool = true
    
    func getFollowers(userName : String , page : Int)
    {
        restrictExe = true
        viewState = .loading
        GFNetworkManager.shared.getFollowers(userName: userName, page: page) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.viewState = .none
            }
            switch result {
            case .success(let followers):
                if followers.count < 100
                {
                    hasMoreFollowes = false
                }
                else
                {
                    hasMoreFollowes = true
                }
                
                DispatchQueue.main.async {
                    withAnimation {
                        print("follower call working..!")
                        self.followers.append(contentsOf: followers)
                    }
                }
                
                if self.followers.isEmpty
                {
                    DispatchQueue.main.async {
                        let emptyStateMessage = "There is no followers for this account,do follow this account 😀..!"
                        self.viewState = .emptyState
                        return
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.viewState = .error
                }
            }
        }
    }
}
