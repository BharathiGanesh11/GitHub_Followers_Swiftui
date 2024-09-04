//
//  GFImageView.swift
//  Github Followers Swiftui
//
//  Created by Kumar on 01/09/24.
//

import SwiftUI

struct GFImageView: View {
    @Binding var urlStr : String
    @State var avatarImage : Image? = nil
    var imageCache = GFNetworkManager.shared.cache
    
    var body: some View {
        VStack
        {
            if let image = avatarImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .clipped()
            }
            else
            {
                Images.placeHolderImg
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .clipped()
            }
        }
        .onAppear{
            print(urlStr)
            downloadAvatar(urlString: urlStr)
        }
    }
    
    func downloadAvatar(urlString : String)
    {
        let keyStr = NSString(string: urlString)
        
        if let image = imageCache.object(forKey: keyStr)
        {
            print("reterived from cache")
            avatarImage = Image(uiImage: image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            avatarImage = nil
            return }
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            
            //guard let self = self else { return }
            
            guard error == nil else { return }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            if let image = UIImage(data: data)
            {
                DispatchQueue.main.async {
                    self.imageCache.setObject(image, forKey: keyStr)
                    print("set image to cache")
                    self.avatarImage = Image(uiImage:image)
                }
            }
        }.resume()
    }
}

#Preview {
    GFImageView(urlStr: .constant(""))
}
