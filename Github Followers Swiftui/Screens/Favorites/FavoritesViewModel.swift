//
//  FavoritesViewModel.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 04/09/24.
//

import Foundation

class FavoritesViewModel : ObservableObject
{
    static let shared = FavoritesViewModel()
    private init(){}
    
    @Published var viewState : ViewState = .none
    
    @Published var favorites : [Follower] = []
    
    @Published var errorResponse = ErrorResponse.shared
    
    func getFavorites()
    {
        PersistenceManager.fetchFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                print(favorites)
                DispatchQueue.main.async {
                    self.favorites = favorites
                }
            case .failure(let error):
                errorResponse.errorMessage = error.rawValue
                DispatchQueue.main.async {
                    self.viewState = .error
                }
            }
        }
    }
    
    func removefavorites(favorite : Follower , offsets : IndexSet)
    {
        PersistenceManager.updateFavorites(actionType: .remove, with: favorite) { [weak self] error in
            guard let self = self else { return }
            
            guard let error = error else {
                favorites.remove(atOffsets: offsets)
                getFavorites()
                return
            }
            
            DispatchQueue.main.async {
                self.errorResponse.errorTitle = CommonWords.unableToRemove
                self.errorResponse.errorMessage = error.rawValue
                self.viewState = .error
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let firstIndex = offsets.first
        {
            removefavorites(favorite: favorites[firstIndex], offsets: offsets)
        }
    }
}

