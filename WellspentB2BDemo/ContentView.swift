import SwiftUI
import WellspentSDK



struct ContentView: View {
    @State private var hasCalledIdentify = false
    @State private var enablePresentOnboarding = false

    var body: some View {
        VStack(spacing: 20) {
            Button("Identify") {
                identify()
            }
            .padding()
            .disabled(hasCalledIdentify)

            Button("Present Onboarding") {
                presentOnboarding()
            }
            .padding()
            .disabled(!enablePresentOnboarding)

            Button("Complete Daily Habit") {
                completedDailyHabit()
            }
            .padding()
            .disabled(!hasCalledIdentify && !enablePresentOnboarding)
        }
        .padding()
    }

    @MainActor 
    func presentOnboarding() {
        let properties = WellspentSDKProperties(
            userId: "user123",
            trackedProperties: ["userLevel": "10"]
        )

        WellspentSDK.shared.presentOnboarding(using: properties) { error in
            if let error {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func identify() {
        let userId = "wellspent_b2b_demo_user_id"

        do {
            try WellspentSDK.shared.identify(as: userId)
            hasCalledIdentify = true
            enablePresentOnboarding = true
        } catch {
            print(error.localizedDescription)
        }
    }

    @MainActor
    func completedDailyHabit() {
        Task {
            do {
                try await WellspentSDK.shared.completeDailyHabit()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
