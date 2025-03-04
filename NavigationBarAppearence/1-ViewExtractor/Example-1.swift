import SwiftUI

struct Example1: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            Main()
                .sheet(isPresented: $isSheetPresented) {
                    ModalFlowView(isPresented: $isSheetPresented)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Start") {
                            isSheetPresented.toggle()
                        }
                    }
                }
        }
        .extract { uiView in
            if let controller = uiView.next as? UINavigationController {
                controller.navigationBar.scrollEdgeAppearance = .transparent
            }
        }
    }
}

extension Example1 {
    struct Main: View {
        var body: some View {
            VStack(spacing: 24) {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.secondary.opacity(0.1))
                NavigationLink("Details A") {
                    DetailsA()
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Main")
        }
    }

    struct DetailsA: View {
        var body: some View {
            VStack(spacing: 24) {
                Image(systemName: "globe.desk")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.secondary.opacity(0.1))
                NavigationLink("Details B") {
                    DetailsB()
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Details A")
        }
    }

    struct DetailsB: View {
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            VStack(spacing: 24) {
                Image(systemName: "globe.europe.africa")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.secondary.opacity(0.1))
                Button("Back") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .applyBackground(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Details B")
        }
    }
}

#Preview {
    Example1()
}
