//
//  MapView.swift
//  Landmark
//
//  Created by Farhana Azman on 23/04/2021.
//

import SwiftUI
import MapKit

struct MapView: View{
    
    var coordinates: CLLocationCoordinate2D
    
//    @State private var region = MKCoordinateRegion()
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
           case near = "Near"
           case medium = "Medium"
           case far = "Far"

           var id: Zoom {
               return self
           }
       }
    
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
       }
    
    var region : MKCoordinateRegion {
        MKCoordinateRegion(center: coordinates,
                           span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
    }
    
//    private func setRegion(_ coordinates: CLLocationCoordinate2D){
//        region = MKCoordinateRegion(
//            center: coordinates,
//            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta))
//    }
}

struct Mapview_Preview: PreviewProvider{
    static var previews: some View{
        MapView(coordinates: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
