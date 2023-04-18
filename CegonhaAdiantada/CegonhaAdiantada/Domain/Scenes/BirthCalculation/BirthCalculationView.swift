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
                VStack {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Quantas semanas e dias o recém nascido tinha na data de seu nascimento?")
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
                    .cornerRadius(10)
                    .padding(.all, .space06)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                    )
                }
                .padding(.all, .space06)
                .navigationTitle("Calcular")
            }
        }
    }
}

struct BirthCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        return BirthCalculationView()
    }
}
