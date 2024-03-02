import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel

    var body: some View {
        switch navigationViewModel.currentScreen {
        case .home:
            HomeView()
        }
    }
}
