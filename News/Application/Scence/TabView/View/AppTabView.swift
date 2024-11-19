//
//  AppTabView.swift
//  News
//
//  Created by Nitin George on 18/11/2024.
//

import SwiftUI
import NetworkModule

struct AppTabView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SecondTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            ThirdTabView()
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }

            FourthTabView()
                .tabItem {
                    Label("Messages", systemImage: "envelope")
                }

            FifthTabView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct FirstTabView: View {
    var body: some View {
        NavigationStack {
            NewsListView(viewModel: NewsListViewModel(articleService: ArticleServiceFactory.articleService()))
        }
    }
}

struct SecondTabView: View {
    var body: some View {
        NavigationStack {
            EmptyView()
        }
    }
}

struct ThirdTabView: View {
    var body: some View {
        NavigationStack {
            EmptyView()
        }
    }
}

struct FourthTabView: View {
    var body: some View {
        NavigationStack {
            EmptyView()
        }
    }
}

struct FifthTabView: View {
    var body: some View {
        NavigationStack {
            EmptyView()
        }
    }
}


// Example in ProfileView
struct ProfileView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator

    var body: some View {
        VStack {
            // Profile content
            Button("Logout") {
                appCoordinator.appState = .loggedOut
            }
        }
    }
}
