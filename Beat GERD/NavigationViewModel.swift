import Foundation

class NavigationViewModel: ObservableObject {
    @Published var currentScreen: Screen = .home
    
    enum Screen {
        case home
    }
}
