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
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Total:")
                    Spacer()
                    Text("\(worker.tinhTheoNgay())")
                        .foregroundColor(worker.tinhTheoNgay() > 2000 ? .purple : .primary)
                }
                Section(header: Text("Today")){
                    HStack {
                        Label("\(worker.tongNgay())", systemImage: "bitcoinsign")
                            .foregroundColor(worker.tongNgay() == 0 ? .gray : .green)
                        Spacer()
                        Button(action: {
                            let newWeek = WeekEarn(tuan: "\(Date.now.formatted(date: .numeric, time: .omitted))", earn: worker.tongNgay())
                            worker.weekEarn.insert(newWeek, at: 0)
                            khong = true
                        }, label:{Image(systemName: "tray.and.arrow.down")})
                    }.alert("Today have saved", isPresented: $khong, actions: {})
                }
                
                Section(header: Text("DAYS WERE SAVED")){
                    ForEach(worker.weekEarn) { tuan in
                        HStack {
                            Text(tuan.tuan)
                            Spacer()
                            Text("$\(tuan.earn)")
                        }
                    }.onDelete {tuan in
                        worker.weekEarn.remove(atOffsets: tuan)
                    }
                }

            }
            .navigationTitle("Summary!")
            .navigationBarItems(leading: Button("Reset"){
                worker.weekEarn.removeAll()
            })
            
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

