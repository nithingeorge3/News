//
//  ArticleView.swift
//  News
//
//  Created by Nitin George on 09/11/2024.
//

import SwiftUI

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            // TODO: Add image view
            if let image = article.image,
               let url = URL(string: image){
                NewsImageView(imageURL: url, imageFrame: (100, 100))

            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }

            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}

#Preview {
    ArticleView(article: Article.dummyData)
}


