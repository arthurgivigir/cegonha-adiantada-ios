//
//  BirthCalculationView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import SwiftUI

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
        VStack {
            TextField(text: $birthCalculation.weeks) {
                Text("Semanas")
            }
            
            TextField(text: $birthCalculation.days) {
                Text("Dias")
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
            
            Button("Calcule") {
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
    }
}

struct BirthCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        return BirthCalculationView()
    }
}
