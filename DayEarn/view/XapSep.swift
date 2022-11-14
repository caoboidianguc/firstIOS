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
                Section(header: Text("Today")){
                    Label("\(tongNgay())", systemImage: "bitcoinsign")
                        .foregroundColor(tongNgay() == 0 ? .gray : .green)
                }
                Section(header: Text("last seven day")){
                    HStack {
                        Label("\(worker.tongTuan())", systemImage: "bitcoinsign")
                            .foregroundColor(worker.tongTuan() > 1500 ? .purple : .green )
                        Spacer()
                        Button(action: {
                            let newWeek = WeekEarn(tuan: "\(Date.now.formatted(date: .numeric, time: .omitted))", earn: worker.tongTuan())
                            worker.weekEarn.insert(newWeek, at: 0)
                        }, label:{Image(systemName: "tray.and.arrow.down")})
                    }
                }
                Section(header: Text("week were saved")){
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
            
        }
    }//body
    private func binding(for khachIndex: Khach) -> Binding<Khach> {
        guard let clientIndex = worker.khach.firstIndex(where: {$0.id == khachIndex.id}) else {fatalError("khong the lay khach index")}
        return $worker.khach[clientIndex]
    }
    
    func tongNgay() -> Int {
        var tong = 0
        for lan in worker.khach {
            if lan.today {
                tong += lan.khachTra()
            }
        }
        return tong
    }
}

struct XapSep_Previews: PreviewProvider {
    static var previews: some View {
        XapSep(worker: .constant(quang))
    }
}

