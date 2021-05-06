//
//  FavoriteButton.swift
//  Landmark
//
//  Created by Farhana Azman on 24/04/2021.
//

import SwiftUI

struct FavoriteButton: View{
    
    //indicates the button’s current state, and provide a constant value for the preview.
    @Binding var isSet: Bool
    
    var body: some View{
        
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
        
    }
}

struct FavoriteButton_preview: PreviewProvider {
    
    static var previews: some View{
        
        FavoriteButton(isSet: .constant(true))
    }
}
