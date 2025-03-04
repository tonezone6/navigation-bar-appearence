import SwiftUI

extension View {
    func extract(result: @escaping (UIView) -> ()) -> some View {
        self.background(ViewExtractor(result: result))
            .compositingGroup()
    }
}

struct ViewExtractor: UIViewRepresentable {
    let result: (UIView) -> ()
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        
        DispatchQueue.main.async {
            if let uiView = view.superview?.superview?.subviews.last?.subviews.first {
                result(uiView)
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
