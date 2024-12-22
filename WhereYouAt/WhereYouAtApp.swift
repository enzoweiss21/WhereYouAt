import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct WhereYouAtApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate // Register AppDelegate for Firebase setup

    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView() // Start with LoginView
            }
        }
    }
}

