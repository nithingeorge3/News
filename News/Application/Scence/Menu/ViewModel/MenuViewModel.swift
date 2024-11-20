//
//  MenuViewModel.swift
//  News
//
//  Created by Nitin George on 15/11/2024.
//

import Combine

class MenuViewModel: ObservableObject {
    
    private var navigationSubject: PassthroughSubject<LoginRoute, Never>
    
    init(onNavigationSubject: PassthroughSubject<LoginRoute, Never>) {
        self.navigationSubject = onNavigationSubject
    }
    
    func performLogOut() {
        navigationSubject.send(.logOut)
    }
}
