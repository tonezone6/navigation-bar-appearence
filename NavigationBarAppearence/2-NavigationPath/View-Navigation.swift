import SwiftUI

struct Navigation<Content, Destination, DestinationContent>: View
where Content: View, Destination: Hashable, DestinationContent: View {
    
    @Binding var destinationPath: [Destination]
    @ViewBuilder let content: () -> Content
    @ViewBuilder let destination: (Destination) -> DestinationContent
    let appearence: ((UINavigationBar) -> Void)?
    
    init(
        path: Binding<[Destination]>,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder destination: @escaping (Destination) -> DestinationContent,
        appearence: ((UINavigationBar) -> Void)? = nil
    ) {
        self.appearence = appearence
        self._destinationPath = path
        self.content = content
        self.destination = destination
    }

    var body: some View {
        NavigationView(
            rootView: content(),
            destinationPath: $destinationPath,
            destination: destination,
            appearence: appearence
        )
        .ignoresSafeArea()
    }
}
