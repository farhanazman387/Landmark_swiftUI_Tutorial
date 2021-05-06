//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Farhana Azman on 22/04/2021.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        
        let mainWindow = WindowGroup {
            
            ContentView()
                .environmentObject(ModelData())
            
        }
        
        #if os(macOS)
            mainWindow
        .commands(content: {
            LandmarkCommands()
        })
        #else
        mainWindow
        #endif
        
        #if os(macOS)
        Settings{
            LandmarkSettings()
        }
        #endif
        
        //The scene only makes sense for watchOS, so add the conditional compilation.
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
