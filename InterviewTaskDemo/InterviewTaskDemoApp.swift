//
//  InterviewTaskDemoApp.swift
//  InterviewTaskDemo
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

@main
struct InterviewTaskDemoApp: App {
    @StateObject var productViewModel = ProductViewModel()
    var body: some Scene {
        WindowGroup {
            ProductsView()
                .environmentObject(productViewModel)
        }
    }
}
