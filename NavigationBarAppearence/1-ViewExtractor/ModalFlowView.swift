import SwiftUI

struct ModalFlowView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            ScreenA(isPresented: $isPresented)
        }
        .extract { uiView in
            if let controller = uiView.next as? UINavigationController {
                controller.navigationBar.prefersLargeTitles = false
                controller.navigationBar.standardAppearance = .opaqueWhite
                controller.navigationBar.scrollEdgeAppearance = .opaqueWhite
            }
        }
    }
}

extension ModalFlowView {
    struct ScreenA: View {
        @Binding var isPresented: Bool
        
        var body: some View {
            VStack {
                NavigationLink("Continue") {
                    ScreenB(isPresented: $isPresented)
                }
                .buttonStyle(.bordered)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        isPresented = false
                    }
                }
            }
            .applyBackground(Color(uiColor: UIColor.systemGroupedBackground))
            .navigationTitle("Step 1")
        }
    }

    struct ScreenB: View {
        @Binding var isPresented: Bool
        
        var body: some View {
            VStack {
                NavigationLink("Continue") {
                    ScreenC(isPresented: $isPresented)
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(uiColor: UIColor.systemGroupedBackground))
            .navigationTitle("Step 2")
        }
    }

    struct ScreenC: View {
        @Binding var isPresented: Bool

        var body: some View {
            VStack {
                Button("Dismiss") {
                    isPresented = false
                }
                .buttonStyle(.borderedProminent)
            }
            .applyBackground(Color(uiColor: UIColor.systemGroupedBackground))
            .navigationTitle("Step 3")
        }
    }
}
