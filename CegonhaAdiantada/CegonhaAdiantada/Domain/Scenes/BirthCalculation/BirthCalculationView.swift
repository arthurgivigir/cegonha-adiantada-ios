//
//  BirthCalculationView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import SwiftUI
import InfiniteLoop

protocol BirthCalculationDisplayLogic {
    func display(viewModel: BirthCalculation.LoadBirthCalculation.ViewModel)
}

extension BirthCalculationView: BirthCalculationDisplayLogic {
    func display(viewModel: BirthCalculation.LoadBirthCalculation.ViewModel) {}
    func fetch() {}
}

struct BirthCalculationView: View {
    typealias Request = BirthCalculation.LoadBirthCalculation.Request
    var interactor: BirthCalculationBusinessLogic?
    
    @ObservedObject var birthCalculation = BirthCalculationDataStore()
    @State private var calendarId: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Pentagon()
                    .fill(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5))
                
                VStack {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Quantas semanas e dias o recém nascido tinha na data do seu nascimento?")
                            HStack {
                                TextField(text: $birthCalculation.weeks.maxlenght(3)) {
                                    Text("Semanas")
                                }
                                .keyboardType(.decimalPad)
                                
                                TextField(text: $birthCalculation.days.maxlenght(3)) {
                                    Text("Dias")
                                }
                                .keyboardType(.decimalPad)
                            }
                        }
                        
                        DatePicker(
                            "Data de Nascimento",
                            selection: $birthCalculation.date,
                            displayedComponents: [.date]
                        )
                        .id(calendarId)
                        .id(calendarId)
                        .onChange(of: birthCalculation.date) { _ in
                            calendarId += 1
                        }
                        
                        Button("Calcular") {
                            interactor?.calculateBabyBirthdays(
                                request:
                                    Request(
                                        weeks: birthCalculation.weeks,
                                        days: birthCalculation.days,
                                        date: birthCalculation.date
                                    )
                            )
                        }
                    }
                    .padding([.top], -150.0)
                }
                .padding(.all, .space06)
                .navigationTitle("Calcular")
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct BirthCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        return BirthCalculationView()
    }
}

public struct Pentagon: Shape {
    /// Creates a square bottomed pentagon.
    public init() {}
    
    var insetAmount: CGFloat = 0
    
    public func path(in rect: CGRect) -> Path {
        let insetRect: CGRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        let width = insetRect.width
        let height = insetRect.height

        return Path { path in
            path.move(to:    CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height/2))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width, y: height/5))
            path.closeSubpath()
        }
        .offsetBy(dx: insetAmount, dy: insetAmount)
    }
}

extension Pentagon: InsettableShape {
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
}
