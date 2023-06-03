//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Cristian Abrudan on 02.06.2023.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
