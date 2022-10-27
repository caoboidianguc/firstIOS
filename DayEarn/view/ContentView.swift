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
    @Environment(\.scenePhase) private var scene
    @State private var manhinh: chon = .khach
    enum chon {
        case khach
        case dv
        case xep
    }
    @State private var tag: Bool = true
    
    var body: some View {
            TabView(selection: $manhinh) {
                ClientList(worker: $worker)
                    .onAppear{tag = true}
                
                .onChange(of: scene){ phase in
                    if phase == .inactive {
                        luuThayDoi()
                    }
                }
                    .tabItem {
                        Label("Client", systemImage: "person.text.rectangle")
                    }
                    .tag(chon.khach)
                    
                
                ServiceView(worker: $worker)
                    .onAppear{tag = false}
                    .tabItem {
                        Label("Services", systemImage: "list.dash")
                    }
                    .tag(chon.dv)
//                XapSep(worker: $worker)
//                    .tabItem{
//                        Label("Search", systemImage: "magnifyingglass")
//                    }
//                    .tag(chon.xep)
                
            }.navigationTitle(tag ? "Clients" : "Services" )
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(worker: .constant(quang), luuThayDoi: {})
        }
    }
}
