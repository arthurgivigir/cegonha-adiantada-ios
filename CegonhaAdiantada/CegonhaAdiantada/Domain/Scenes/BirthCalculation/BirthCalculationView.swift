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
        birthCalculation.result = viewModel.result
        birthCalculation.calculusToBeSaved = viewModel.calculusToBeSaved
        birthCalculation.showPopUp = true
    }
    
    func fetch() {
        let calculus = Calculus(
            weeks: birthCalculation.weeks,
            days: birthCalculation.days,
            birthDate: birthCalculation.date
        )
        
        hideKeyboard()
        interactor?.calculateBabyBirthdays(request: Request(calculus: calculus))
    }
}

extension BirthCalculationView: BirthCalculationDelegate {
    func closePopUp() {
        birthCalculation.showPopUp = false
    }
    
    func saveBirthCalculation() {
        fetch()
        savesData.showPopUp = true
        savesData.savedCalculus = birthCalculation.calculusToBeSaved
        birthCalculation.selectedTabBar = .saves
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
    
    @ObservedObject var savesData: SavesDataStore
    @ObservedObject var birthCalculation: BirthCalculationDataStore
    
    @State private var calendarId: Int = 0

    init(
        birthCalculation: BirthCalculationDataStore,
        savesData: SavesDataStore
    ) {
        self.birthCalculation = birthCalculation
        self.savesData = savesData
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Colors.primaryFontColor.color)
        ]
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Colors.primaryFontColor.color)
        ]
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ScrollWithBackgroundView(fillColor: Colors.primary.color.opacity(0.1)) {
                VStack {
                    Spacer()
                        .frame(height: 100)
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
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: Sizes.size06.cgFloat) {
                                TextField("Semanas", text: $birthCalculation.weeks.maxlenght(3))
                                    .textFieldStyle(
                                        GradientTextFieldBackground(
                                            systemImageString: "calendar",
                                            fontColor: .primaryFontColor
                                        )
                                    )
                                
                                
                                Text("Data de Nascimento")
                                    .foregroundColor(Colors.primaryFontColor.color)
                                    .font(
                                        .system(
                                            .title3,
                                            design: .rounded
                                        )
                                        .weight(.medium)
                                    )
                                    .padding(.top, 15)
                            }
                            
                            VStack(alignment: .leading, spacing: Sizes.size06.cgFloat) {
                                TextField("Dias", text: $birthCalculation.days.maxlenght(3))
                                    .textFieldStyle(
                                        GradientTextFieldBackground(
                                            systemImageString: "calendar",
                                            fontColor: .primaryFontColor
                                        )
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
                                .tint(Colors.primaryFontColor.color)
                                .foregroundColor(Colors.primaryFontColor.color)
                                .colorInvert()
                                .labelsHidden()
                                .colorMultiply(Colors.primaryFontColor.color)
                                .environment(\.locale, Locale.init(identifier: "pt-br"))
                                .padding(.top, 10)
                            }
                        }
                        
                        LargeButton(
                            title: "Calcular",
                            backgroundColor: Color.white,
                            foregroundColor: Colors.primaryFontColor.color
                        ) {
                            fetch()
                        }
                    }
                    .padding(.horizontal, .size20)
                    Spacer()
                }
                .navigationBarTitle(
                    Text("Calcular")
                )
                .popup(isPresented: $birthCalculation.showPopUp) {
                    ResultPopUpView(
                        delegate: self,
                        birthCalculation: birthCalculation
                    )
                } customize: {
                    $0.closeOnTapOutside(true)
                        .position(.top)
                        .animation(.spring())
                        .isOpaque(true)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .onAppear {
                birthCalculation.calculusToBeSaved = nil
            }
        }
    }
}

struct BirthCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        BirthCalculationView(birthCalculation: BirthCalculationDataStore(), savesData: SavesDataStore())
        
        BirthCalculationView(birthCalculation: BirthCalculationDataStore(), savesData: SavesDataStore())
            .previewDevice(PreviewDevice(rawValue: "iPhone 6s"))
            .previewDisplayName("iPhone 6s")
    }
}
