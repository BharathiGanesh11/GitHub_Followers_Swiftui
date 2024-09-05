//
//  FavoritesList.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 04/09/24.
//

import SwiftUI

struct FavoritesList: View {
    @ObservedObject var favoritesVM = FavoritesViewModel.shared
    var body: some View {
        NavigationStack {
            ZStack
            {
                VStack
                {
                    if favoritesVM.favorites.isEmpty
                    {
                        EmptyStateView(title: CommonWords.noFavorites)
                    }
                    else
                    {
                        List{
                            ForEach(favoritesVM.favorites.indices , id: \.self) { i in
                                NavigationLink {
                                    FollowerView(username: favoritesVM.favorites[i].login)
                                } label: {
                                    FavoritesCell(favorite: favoritesVM.favorites[i])
                                }
                            }
                            .onDelete(perform: favoritesVM.delete)
                        }
                        .listStyle(.plain)
                    }
                }
                
                switch favoritesVM.viewState {
                case .error:
                    GFAlert(showAlert: Binding(get: {
                        false
                    }, set: { _ in
                        favoritesVM.viewState = .none
                    }), alertTitle: favoritesVM.errorResponse.errorTitle, message: favoritesVM.errorResponse.errorMessage, btntitle: "Ok")
                default :
                    EmptyView()
                }
            }
            .background(GFColors.systemBackground)
            .navigationTitle(CommonWords.favorites)
            .onAppear{
                favoritesVM.getFavorites()
            }
        }
    }
}

#Preview {
    FavoritesList()
}
