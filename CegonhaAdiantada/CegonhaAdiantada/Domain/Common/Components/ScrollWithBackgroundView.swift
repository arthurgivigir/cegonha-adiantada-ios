//
//  ScrollWithBackgroundView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 01/05/23.
//

import SwiftUI
import InfiniteLoop

struct ScrollWithBackgroundView<Content: View>: View {
    var axes: Axis.Set = [.vertical]
    var showsIndicators = true
    var fillColor = Color.primary.opacity(0.1)
    var lottieAnimation = LottieFiles.babyMom
    
    @State var position: CGPoint = CGPoint(x: 0, y: 0)
    @State var positionWithAnimation: CGPoint = CGPoint(x: 0, y: 0)
    @ViewBuilder var content: () -> Content

    var body: some View {
        OffsetObservingScrollView(offset: $position, content: content)
            .background {
                GeometryReader { geometry in
                    PentagonShape()
                        .offset(y: -positionWithAnimation.y)
                        .fill(
                            fillColor
                        )
                        .ignoresSafeArea()
                        .overlay {
                            GeometryReader { geometry in
                                VStack {
                                    LottieView(filename: lottieAnimation)
                                        .frame(
                                            width: geometry.size.width/2.5,
                                            height: geometry.size.height/3
                                        )
                                        .offset(
                                            x: geometry.size.width - geometry.size.width/3,
                                            y: -(geometry.size.height/6) - positionWithAnimation.y
                                        )
                                    Spacer()
                                }
                            }
                        }
                        // 50 space is to avoid white space when scrolls
                        .frame(height: geometry.size.height + 50 + positionWithAnimation.y)
                        .onChange(of: position, perform: { newValue in
                            withAnimation(.linear) {
                                // To avoid adding values larger than necessary
                                if newValue.y <= geometry.size.height/2 {
                                    positionWithAnimation = newValue
                                }
                            }
                        })
                }
            }
    }
}

struct GenericList<Element,  RowContent: View>: View where Element: Identifiable {
    
    // 2
    private let items: [Element]
    private let rowContent: (Element) -> RowContent

    // 3
    public init(_ items: [Element], @ViewBuilder rowContent: @escaping (Element) -> RowContent) {
        self.items = items
        self.rowContent = rowContent
    }
    
    // 4
    var body: some View {
        List(items, rowContent: rowContent)
    }
}

struct ListWithBackgroundView<Element, Content: View>: View where Element: Identifiable {
    internal init(
        axes: Axis.Set = [.vertical],
        showsIndicators: Bool = true,
        fillColor: Color = Color.primary.opacity(0.1),
        lottieAnimation: LottieFiles = LottieFiles.babyMom,
        position: CGPoint = CGPoint(x: 0, y: 0),
        positionWithAnimation: CGPoint = CGPoint(x: 0, y: 0),
        items: Binding<[Element]>,
        content: @escaping () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.fillColor = fillColor
        self.lottieAnimation = lottieAnimation
        self.position = position
        self.positionWithAnimation = positionWithAnimation
        self._items = items
        self.content = content
    }
    
    var axes: Axis.Set = [.vertical]
    var showsIndicators = true
    var fillColor = Color.primary.opacity(0.1)
    var lottieAnimation = LottieFiles.babyMom
    
    @State var position: CGPoint = CGPoint(x: 0, y: 0)
    @State var positionWithAnimation: CGPoint = CGPoint(x: 0, y: 0)
    @Binding var items: [Element]
    @ViewBuilder var content: () -> Content

    var body: some View {
        OffsetObservingListView(offset: $position, items: $items, content: content)
            .background {
                GeometryReader { geometry in
                    PentagonShape()
                        .offset(y: -positionWithAnimation.y)
                        .fill(
                            fillColor
                        )
                        .ignoresSafeArea()
                        .overlay {
                            GeometryReader { geometry in
                                VStack {
                                    LottieView(filename: lottieAnimation)
                                        .frame(
                                            width: geometry.size.width/2.5,
                                            height: geometry.size.height/3
                                        )
                                        .offset(
                                            x: geometry.size.width - geometry.size.width/3,
                                            y: -(geometry.size.height/6) - positionWithAnimation.y
                                        )
                                    Spacer()
                                }
                            }
                        }
                        // 50 space is to avoid white space when scrolls
                        .frame(height: geometry.size.height + 50 + positionWithAnimation.y)
                        .onChange(of: position, perform: { newValue in
                            withAnimation(.linear) {
                                // To avoid adding values larger than necessary
                                print("🚧 \(newValue), position: \(position), altura: \(geometry.size.height/2)")
                                if newValue.y <= geometry.size.height/2, (position.y > 0 || position.y < 240) {
                                    positionWithAnimation.y = newValue.y
                                }
                            }
                        })
                }
            }
    }
}

struct ScrollWithBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollWithBackgroundView() {
            VStack { Text("Teste") }
        }
    }
}
