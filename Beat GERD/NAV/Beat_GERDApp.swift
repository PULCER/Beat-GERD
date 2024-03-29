import SwiftUI
import SwiftData

@main
struct Beat_GERDApp: App {
    @StateObject var navigationViewModel = NavigationViewModel()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CorrelativeItem.self,
            CustomUserData.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationView()
                .environmentObject(navigationViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
