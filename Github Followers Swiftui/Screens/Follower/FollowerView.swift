//
//  FollowerView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 31/08/24.
//

import SwiftUI

struct FollowerView: View {
    @ObservedObject var searchVm : SearchViewModel
    var body: some View {
        VStack
        {
            Spacer()
        }
        .navigationTitle(searchVm.userName)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    FollowerView(searchVm: SearchViewModel())
}
