//
//  HomeView.swift
//  News
//
//  Created by Nitin George on 02/11/2024.
//

import SwiftUI

struct DashboardView : View {
    
    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        Text("Dashboard View")
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}
