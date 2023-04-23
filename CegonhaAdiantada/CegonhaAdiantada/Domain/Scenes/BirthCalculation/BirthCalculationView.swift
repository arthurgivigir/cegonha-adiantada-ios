//
//  BirthCalculationView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 14/04/23.
//  
//
import SwiftUI
import InfiniteLoop
import Lottie

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
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    @ObservedObject var birthCalculation = BirthCalculationDataStore()
    @State private var calendarId: Int = 0

    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Colors.quaternary.color)
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    VStack {
                        LottieView(filename: .babyMom)
                            .frame(width: geometry.size.width/2.0, height: geometry.size.height/3)
                            .offset(x: geometry.size.width - geometry.size.width/2.2, y: -(geometry.size.height/8))
                        Spacer()
                    }
                }

                PentagonShape()
                    .fill(Colors.primary.color.opacity(0.6))
                
                VStack {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Quantas semanas e dias o recém nascido tinha na data do seu nascimento?")
                                .foregroundColor(Colors.primaryFontColor.color)
                                .font(
                                    .system(
                                        .title3,
                                        design: .rounded
                                    )
                                    .weight(.medium)
                                )
                            
                            HStack {
                                TextField("Semanas", text: $birthCalculation.weeks.maxlenght(3))
                                    .textFieldStyle(
                                        GradientTextFieldBackground(
                                            systemImageString: "calendar"
                                        )
                                    )
                                
                                TextField("Dias", text: $birthCalculation.days.maxlenght(3))
                                    .textFieldStyle(
                                        GradientTextFieldBackground(
                                            systemImageString: "calendar"
                                        )
                                    )
                            }
                            .padding([.top, .bottom], CGFloat(Spaces.space04.rawValue))
                        }
                
                        HStack {
                            Text("Data de Nascimento")
                                .foregroundColor(Colors.primaryFontColor.color)
                                .font(
                                    .system(
                                        .title3,
                                        design: .rounded
                                    )
                                    .weight(.thin)
                                )

                            DatePicker(
                                "Data de Nascimento",
                                selection: $birthCalculation.date,
                                displayedComponents: [.date]
                            )
                            .id(calendarId)
                            .onChange(of: birthCalculation.date) { _ in
                                calendarId += 1
                            }
                            .buttonStyle(.bordered)
                            .font(
                                .system(
                                    .body,
                                    design: .rounded
                                )
                                .weight(.light)
                            )
                            .tint(Colors.quaternary.color)
                            .foregroundColor(Colors.quaternary.color)
                            .colorInvert()
                            .labelsHidden()
                            .colorMultiply(Colors.primaryFontColor.color)
                            .environment(\.locale, Locale.init(identifier: "pt-br"))
                        }
                        
                        LargeButton(
                            title: "Calcular",
                            backgroundColor: Color.white,
                            foregroundColor: Colors.quaternary.color
                        ) {
                            interactor?.calculateBabyBirthdays(
                                request:
                                    Request(
                                        weeks: birthCalculation.weeks,
                                        days: birthCalculation.days,
                                        date: birthCalculation.date
                                    )
                            )
                        }
                        .padding([.top], 20)
                    }
                    .padding([.top], -180.0)
                }
                .padding(.all, 30)
                .navigationBarTitle(
                    Text("Calcular")
                )
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
