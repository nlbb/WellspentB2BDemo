import SwiftUI
import WellspentSDK

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Connect") {
                connect()
            }
        }
        .padding()
    }

    @MainActor 
    func connect() {
        let properties = WellspentSDKProperties(
            userId: "user123",
            trackedProperties: ["userLevel": "10"]
        )
        WellspentSDK.shared.presentOnboarding(using: properties) { error in
            if let error {
                // Handle connection error
            } else {
                // Proceed with enabling SDK functionality
            }
        }
    }
}

#Preview {
    ContentView()
}
