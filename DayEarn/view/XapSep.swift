//
//  XapSep.swift
//  DayEarn
//
//  Created by Thong Vu on 10/26/22.
//

import SwiftUI

struct XapSep: View {
    @Binding var worker: Technician
    @State private var khong: Bool = false
    var xap: [Khach] {
        worker.khach.sorted(by: {$0.name < $1.name || !khong})
    }
    
    @State private var text = ""
    @State private var listDaTim: [Khach] = []
    
    var body: some View {
        NavigationView {
            List {
                Toggle("Sort by name", isOn: $khong)
                ForEach(text == "" ? xap : listDaTim){ kha in
                    NavigationLink(destination: ClientDetail(worker: $worker, khach: binding(for: kha))){
                        KhachRow(khach: kha)
                    }
                }.navigationTitle("Phu")
            }
            .searchable(text: $text, placement: .automatic, prompt: "Find Name")
            .onChange(of: text){ timTu in
                listDaTim = worker.khach.filter{$0.name.contains(timTu)}
        }
        }
    }//body
    private func binding(for khachIndex: Khach) -> Binding<Khach> {
        guard let clientIndex = worker.khach.firstIndex(where: {$0.id == khachIndex.id}) else {fatalError("khong the lay khach index")}
        return $worker.khach[clientIndex]
    }
    
}

struct XapSep_Previews: PreviewProvider {
    static var previews: some View {
        XapSep(worker: .constant(quang))
    }
}
