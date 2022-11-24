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
                ContentView(worker: $ledger.worker) {
                    ledger.save()
                }.environmentObject(ledger)
                .onAppear {
                    ledger.load()
                }
        }
    }
}
