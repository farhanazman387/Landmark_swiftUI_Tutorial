//
//  CategoryHome.swift
//  Landmark
//
//  Created by Farhana Azman on 27/04/2021.
//

import SwiftUI

struct CategoryHome: View{
    
    @State private var showingProfile = false
    @EnvironmentObject var modelData: ModelData
    
    var body: some View{
        
        NavigationView{
            
            List{
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
                    
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    
                }.listRowInsets(EdgeInsets())
                
            }.listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar{
                Button(action: { showingProfile.toggle() }){
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }.sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environmentObject(modelData)
            })
            
        }
        
    }
    
}

struct CategoryHome_Preview :PreviewProvider{
    
    static var previews: some View{
        
        CategoryHome()
            .environmentObject(ModelData())
        
    }
    
}
