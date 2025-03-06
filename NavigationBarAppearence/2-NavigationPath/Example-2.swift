import SwiftUI

struct Example2: View {
    enum Destination: Hashable {
        case detailsA
        case detailsB
        case detailsC
    }
    
    @State private var path: [Destination] = []
    
    var body: some View {
        Navigation(path: $path) {
            Main(
                onDetailsAButtonTap: {
                    path.append(.detailsA)
                },
                onDetailsBButtonTap: {
                    path.append(.detailsB)
                }
            )
        } destination: { destination in
            switch destination {
            case .detailsA:
                DetailsA()
            case .detailsB:
                DetailsB(onButtonTap: {
                    path.append(.detailsC)
                })
            case .detailsC:
                DetailsC(onButtonTap: {
                    path.removeAll()
                })
            }
        } appearence: { navigationBar in
            navigationBar.tintColor = UIColor(white: 0.2, alpha: 1)
            navigationBar.prefersLargeTitles = true
            navigationBar.scrollEdgeAppearance = .customTransparent
            navigationBar.standardAppearance = .customOpaque
        }
    }
}

extension Example2 {
    struct Main: View {
        let onDetailsAButtonTap: () -> Void
        let onDetailsBButtonTap: () -> Void
        
        var body: some View {
            VStack {
                Button("Details A") {
                    onDetailsAButtonTap()
                }
                Button("Details B") {
                    onDetailsBButtonTap()
                }
            }
            .buttonStyle(.bordered)
            .applyBackground(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Main")
        }
    }

    struct DetailsA: View {
        var body: some View {
            ScrollView {
                VStack {
                    ForEach(0...20, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .frame(height: 80)
                    }
                }
                .padding()
            }
            .applyBackground(Color(uiColor: .systemGroupedBackground))
            //.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Details A")
        }
    }

    struct DetailsB: View {
        let onButtonTap: () -> Void
        
        var body: some View {
            VStack {
                Button("Details C") {
                    onButtonTap()
                }
                .buttonStyle(.bordered)
            }
            .applyBackground(Color(uiColor: .systemGroupedBackground))
            //.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Details B")
        }
    }

    struct DetailsC: View {
        let onButtonTap: () -> Void
        
        var body: some View {
            Button("Back to Main") {
                onButtonTap()
            }
            .buttonStyle(.borderedProminent)
            .applyBackground(Color(uiColor: .systemGroupedBackground))
            //.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Details C")
        }
    }
}

#Preview {
    Example2()
}
