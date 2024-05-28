import UIKit
import WellspentSDK

@MainActor
public final class AppDelegate: NSObject,UIApplicationDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            try WellspentSDK.shared.configure(
                with: WellspentSDKConfiguration(
                    partnerId: "example",
                    localizedAppName: "Example App",
                    redirectionURL: URL(string: "https://www.wellspent.so")!,
                    environment: .staging
                )
            )
        } catch {
            print("Error initializing SDK: \(error.localizedDescription)")
        }

        return true
    }
}
