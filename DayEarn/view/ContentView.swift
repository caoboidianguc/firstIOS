//
//  ContentView.swift
//  DayEarn
//
//  Created by Thong Vu on 11/24/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var worker: Technician
    let luuThayDoi: () -> Void
    @Environment(\.scenePhase) private var scenePhase
    @State private var manhinh: chon = .khach
    enum chon {
        case schedule
        case khach
        case dv
        case xep
    }
    
    var body: some View {
            TabView(selection: $manhinh) {
                ScheduleView(worker: $worker)
                    .tabItem {
                        Label("Schedule", systemImage: "calendar.badge.clock")
                    }
                    .tag(chon.schedule)
                ClientList(worker: $worker)
                    .tabItem {
                        Label("Clients", systemImage: "person.text.rectangle")
                    }
                    .tag(chon.khach)
                    
                
                ServiceView(worker: $worker)
                    .tabItem {
                        Label("Services", systemImage: "list.dash")
                    }
                    .tag(chon.dv)
                
                XapSep(worker: $worker)
                    .tabItem{
                        Label("Earns", systemImage: "scroll")
                    }
                    .tag(chon.xep)
                
            }
            .onChange(of: scenePhase){ phase in
                if phase == .inactive {
                    luuThayDoi()
                }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView(worker: .constant(quang), luuThayDoi: {})
                .environmentObject(KhachData())
    }
}
