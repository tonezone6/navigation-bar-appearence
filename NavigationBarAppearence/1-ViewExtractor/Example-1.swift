import SwiftUI

struct Example1: View {
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ViewA()
                .sheet(isPresented: $isSheetPresented) {
                    ModalView(isPresented: $isSheetPresented)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Start") {
                            isSheetPresented.toggle()
                        }
                    }
                }
                .navigationAppearence { navigationBar in
                    navigationBar?.scrollEdgeAppearance = .customTransparent
                }
        }
    }
}

extension Example1 {
    struct ViewA: View {
        var body: some View {
            VStack(spacing: 24) {
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.secondary.opacity(0.1))
                NavigationLink("Go to B") {
                    ViewB()
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Details A")
        }
    }

    struct ViewB: View {
        var body: some View {
            VStack(spacing: 24) {
                Image(systemName: "globe.desk")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.secondary.opacity(0.1))
                NavigationLink("Go to C") {
                    ViewC()
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(UIColor.systemGroupedBackground))
            .navigationBarTintColor(.red)
            .navigationTitle("Details B")
        }
    }

    struct ViewC: View {
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            VStack(spacing: 24) {
                Image(systemName: "globe.europe.africa")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.secondary.opacity(0.1))
                Button("Back to B") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .applyBackground(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Details C")
        }
    }
}

#Preview {
    Example1()
}
