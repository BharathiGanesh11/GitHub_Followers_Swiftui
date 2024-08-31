//
//  SearchViewModel.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

class SearchViewModel : ObservableObject
{
    @Published var userName : String = ""
    @Published var showFollowerView : Bool = false
}
