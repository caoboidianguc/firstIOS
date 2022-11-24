//
//  DayEarnApp.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import SwiftUI

@main
struct DayEarnApp: App {
    @StateObject var ledger = KhachData()
    var body: some Scene {
        WindowGroup {
                ContentView(worker: $ledger.worker) {
                    ledger.save()
                }.environmentObject(ledger)
                .onAppear {
                    ledger.load()
                }
        }
    }
}
