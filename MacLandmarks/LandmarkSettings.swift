//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by Farhana Azman on 04/05/2021.
//

import SwiftUI

struct LandmarkSettings: View {
    
    @AppStorage ("Mapview.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View{
        Form{
            Picker("Map Zoom:", selection: $zoom){
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }.pickerStyle(InlinePickerStyle())
        }
        .frame(width: 300)
        .navigationTitle("Landmark Setting")
        .padding(80)
    }
}

struct LandmarkSettings_Preview: PreviewProvider {
    static var previews: some View{
        LandmarkSettings()
    }
}
