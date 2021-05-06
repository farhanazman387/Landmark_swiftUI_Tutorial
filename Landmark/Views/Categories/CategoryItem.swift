//
//  CategoryItem.swift
//  Landmark
//
//  Created by Farhana Azman on 27/04/2021.
//

import SwiftUI

struct CategoryItem: View{
    
    var landmark: Landmark
    
    var body: some View{
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

struct CategoryItem_preview : PreviewProvider{
    static var previews: some View{
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
