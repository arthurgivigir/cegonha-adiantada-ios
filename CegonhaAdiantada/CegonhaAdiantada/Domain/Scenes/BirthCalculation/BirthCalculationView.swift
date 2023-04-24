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
import PopupView

protocol BirthCalculationDelegate {
    func saveBirthCalculation()
    func closePopUp()
}

protocol BirthCalculationDisplayLogic {
    func display(viewModel: BirthCalculation.LoadBirthCalculation.ViewModel)
}

extension BirthCalculationView: BirthCalculationDisplayLogic {
    func display(viewModel: BirthCalculation.LoadBirthCalculation.ViewModel) {
        birthCalculation.showPopUp = true
        birthCalculation.resultDays = viewModel.days
        birthCalculation.resultWeeks = viewModel.weeks
        birthCalculation.resultTotalDays = viewModel.totalDays
    }
    
    func fetch() {
        hideKeyboard()
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

extension BirthCalculationView: BirthCalculationDelegate {
    func closePopUp() {
        birthCalculation.showPopUp = false
    }
    
    func saveBirthCalculation() {
        print("\(birthCalculation.resultTotalDays)")
    }
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
            .foregroundColor: UIColor(Colors.primaryFontColor.color)
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    VStack {
                        LottieView(filename: .babyMom)
                            .frame(width: geometry.size.width/2.5, height: geometry.size.height/3)
                            .offset(x: geometry.size.width - geometry.size.width/3, y: -(geometry.size.height/6))
                        Spacer()
                    }
                }

                PentagonShape()
                    .fill(Colors.primary.color.opacity(0.5))
                    .ignoresSafeArea()
                
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
                            fetch()
                        }
                    }
                    .padding([.top], -180.0)
                }
                .padding(.all, 20)
                .navigationBarTitle(
                    Text("Calcular")
                )
                .popup(isPresented: $birthCalculation.showPopUp) {
                    ResultPopUpView(
                        delegate: self,
                        weeks: birthCalculation.resultWeeks,
                        days: birthCalculation.resultDays,
                        totalDays: birthCalculation.resultTotalDays
                    )
                } customize: {
                    $0.closeOnTapOutside(true)
                        .position(.top)
                        .animation(.spring())
                        .isOpaque(true)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

struct BirthCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        BirthCalculationView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
        
        BirthCalculationView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 6s"))
            .previewDisplayName("iPhone 6s")
    }
}
