//
//  ContentView.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI


struct ContentView: View {
    @Binding var worker: Technician
    let luuThayDoi: () -> Void
    @Environment(\.scenePhase) private var scenePhase
    @State private var manhinh: chon = .khach
    enum chon {
        case khach
        case dv
        case xep
    }
    
    var body: some View {
            TabView(selection: $manhinh) {
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
                        Label("Earns", systemImage: "dongsign")
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
