//
//  Constants.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

enum SFSymbols
{
    static let location = "mappin.and.ellipse"
    static let repos = "folder"
    static let gists = "text.alignleft"
    static let followers = "person.2"
    static let following = "heart"
    static let magnifyingglass = "magnifyingglass"
    static let star = "star"
}

enum CommonWords
{
    static let search = "Search"
    static let favorites = "Favorites"
    static let enterUserName = "Enter a Username"
    static let getFollowers = "Get Followers"
    static let plsEnterUserNameToSearch = "Please Enter a User Name to Search"
    static let done = "Done"
    static let getProfile = "Get Profile"
    static let github = "GitHub"
    static let emptyStateMessage = "There is no followers for this account , do follow this account 😀..!"
    static let unableToRemove = "Unable To Remove"
    static let noFavorites = "There is no favorites added yet , please add a favorite user 😇..!"
}

enum Images
{
    static let logo = Image("Logo")
    static let placeHolderImg = Image("PlaceHolder")
    static let emptyState = Image("EmptyState")
}

enum Device {
    static let size = UIScreen.main.bounds
    static let screenWidth = size.width
    static let screenHeight = size.height
}

enum GFColors {
    static let borderColor = Color(uiColor: UIColor.systemGray4)
    static let sysGrey = Color(uiColor: UIColor.systemGray)
    static let sysGreen = Color(uiColor: UIColor.systemGreen)
    static let sysPink = Color(uiColor: UIColor.systemPink)
    static let systemBackground = Color(uiColor: UIColor.systemBackground)
    static let secondarySysBackground = Color(uiColor: UIColor.secondarySystemBackground)
    static let sysPurple = Color(uiColor: UIColor.systemPurple)
}

// Error class
class ErrorResponse : ObservableObject
{
    static let shared = ErrorResponse()
    private init(){}
    @Published var errorTitle : String = "Something Went Wrong"
    @Published var errorMessage : String = ""
}
