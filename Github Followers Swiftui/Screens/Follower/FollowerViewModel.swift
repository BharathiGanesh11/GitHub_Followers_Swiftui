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
    
    static let shared = FollowerViewModel()
    
    private init(){}
    
    @Published var followers : [Follower] = []
    @Published var viewState : ViewState = .none
    var page = 1
    var hasMoreFollowes : Bool = true
    var isFiltered : Bool = false
    
    @Published var restrictExe : Bool = true
    
    @Published var userName : String = ""
    {
        didSet
        {
            followers = []
            page = 1
            getFollowers(userName: userName, page: page)
        }
    }
    
    @ObservedObject var errorResponse = ErrorResponse.shared
    
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
                    
                    if self.followers.isEmpty
                    {
                        self.viewState = .emptyState
                    }
                }
            case .failure(let error):
                self.errorResponse.errorMessage = error.rawValue
                DispatchQueue.main.async {
                    self.viewState = .error
                }
            }
        }
    }
    
    
    func addToFavorites()
    {
        GFNetworkManager.shared.getUserInfo(userName: userName) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let userInfo):
                let favorite = Follower(login: userInfo.login, avatarUrl: userInfo.avatarUrl)
                PersistenceManager.updateFavorites(actionType: .add, with: favorite) { error in
                    guard let error = error else {
                        self.errorResponse.errorTitle = CommonWords.github
                        self.errorResponse.errorMessage = GFError.addedToFavoriteList.rawValue
                        DispatchQueue.main.async {
                            self.viewState = .error
                        }
                        return
                    }
                    
                    self.errorResponse.errorMessage = error.rawValue
                    DispatchQueue.main.async {
                        self.viewState = .error
                    }
                    
                }
            case .failure(let error):
                self.errorResponse.errorMessage = error.rawValue
                DispatchQueue.main.async {
                    self.viewState = .error
                }
            }
        }
    }
}
