//
//  LandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by Farhana Azman on 29/04/2021.
//

import SwiftUI

struct LandmarkDetail: View{
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View{
        
        ScrollView{
            VStack {
                CircleImage(image: landmark.image.resizable()).scaledToFill()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite){
                    Text("Favourite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                Divider()
                
                MapView(coordinates: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmark")
    }
}

struct LandmarkDetail_Preview: PreviewProvider{
    
    static var previews: some View{
        
        let modelData = ModelData()
        return
            Group{
                LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")
            
                LandmarkDetail(landmark: modelData.landmarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
            }
    }
}
