//
//  GhiChu.swift
//  DayEarn
//
//  Created by Thong Vu on 11/11/22.
//

import SwiftUI

struct GhiChu: View {
    var nhanVien: Technician
    var body: some View {
        List {
            
            Text("For today: $\(nhanVien.tongTuan())")
        }
    }
}

struct GhiChu_Previews: PreviewProvider {
    static var previews: some View {
        GhiChu(nhanVien: quang)
    }
}
