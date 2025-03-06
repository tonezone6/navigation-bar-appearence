import SwiftUI

struct ModalView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            ViewA(isPresented: $isPresented)
                .navigationAppearence { navigationBar in
                    navigationBar?.prefersLargeTitles = false
                    navigationBar?.standardAppearance = .customOpaque
                    navigationBar?.scrollEdgeAppearance = .customOpaque
                }
        }
    }
}

extension ModalView {
    struct ViewA: View {
        @Binding var isPresented: Bool
        
        var body: some View {
            VStack {
                NavigationLink("Continue") {
                    ViewB(isPresented: $isPresented)
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
            .navigationTitle("Step A")
        }
    }

    struct ViewB: View {
        @Binding var isPresented: Bool
        
        var body: some View {
            VStack {
                NavigationLink("Continue") {
                    ViewC(isPresented: $isPresented)
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(uiColor: UIColor.systemGroupedBackground))
            .navigationTitle("Step B")
        }
    }

    struct ViewC: View {
        @Binding var isPresented: Bool

        var body: some View {
            VStack {
                Button("Dismiss") {
                    isPresented = false
                }
                .buttonStyle(.borderedProminent)
            }
            .applyBackground(Color(uiColor: UIColor.systemGroupedBackground))
            .navigationTitle("Step C")
        }
    }
}
