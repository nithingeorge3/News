//
//  AppTabViewFactory.swift
//  News
//
//  Created by Nitin George on 19/11/2024.
//

protocol AppTabViewFactoryType {
    func makeAppTabView() -> AppTabView
}

class AppTabViewFactory: AppTabViewFactoryType {
    
    func makeAppTabView() -> AppTabView {
        AppTabView()
    }
}
