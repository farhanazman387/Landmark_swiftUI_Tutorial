//
//  LandmarkList.swift
//  WatchLandmarks Extension
//
//  Created by Farhana Azman on 03/05/2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmark: [Landmark]{
        modelData.landmarks.filter{ landmark in
            
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View{
        
        NavigationView{
            
            List{
                
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favourites only")
                })
                
                ForEach (filteredLandmark){ landmark in
                    
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        
                        LandmarkRow(landmark: landmark)
                        
                    }
                    
                }
                
            }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Preview: PreviewProvider{
    
    static var previews: some View{
        
        LandmarkList()
            .environmentObject(ModelData())
        
    }
}

