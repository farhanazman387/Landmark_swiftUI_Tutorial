//
//  LandmarkDetail.swift
//  Landmark
//
//  Created by Farhana Azman on 23/04/2021.
//

import SwiftUI

struct LandmarkDetail: View{
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View{
        
        ScrollView {
            
            MapView(coordinates: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    
                }
                
                HStack {
                    
                    Text(landmark.park).font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                    
                }.font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
                
            }.padding()
            
        }.navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetail_Preview: PreviewProvider{
    
    static let modelData = ModelData()
    
    static var previews: some View{
        
        LandmarkDetail(landmark: modelData.landmarks[6])
            .environmentObject(modelData)
    
    }
}
