//
//  CircleImage.swift
//  Landmark
//
//  Created by Farhana Azman on 23/04/2021.
//

import SwiftUI

struct CircleImage: View{
    
    var image: Image
    
    var body: some View{
        
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Preview:PreviewProvider{
    static var previews: some View{
        
        CircleImage(image: Image("turtlerock"))
        
    }
}
