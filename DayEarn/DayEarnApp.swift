//
//  DayEarnApp.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

@main
struct DayEarnApp: App {
    @StateObject var ledger = KhachData()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(worker: $ledger.worker) {
                    ledger.save()
                }
            }.onAppear {
                ledger.load()
            }
        }
    }
}
