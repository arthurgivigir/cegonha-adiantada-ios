//
//  SavesView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import SwiftUI
import PopupView

protocol SavesDelegate {
    func saveBirthCalculation()
    func closePopUp()
}

protocol SavesDisplayLogic {
    func display(viewModel: Saves.LoadSaves.ViewModel)
}

extension SavesView: SavesDisplayLogic {
    func display(viewModel: Saves.LoadSaves.ViewModel) {}
    func fetch() {}
}

extension SavesView: SavesDelegate {
    func saveBirthCalculation() {
        let savedCalculus = CalculusJson(context: managedObjectContext)
        savedCalculus.dateTime = .now
        savedCalculus.json = savesData.savedCalculus?.toJson
        
        if savesData.babyName == .empty {
            savedCalculus.babyName = Date().formatted(.dateTime.locale(Locale(identifier: "pt-br")))
        } else {
            savedCalculus.babyName = savesData.babyName
        }
        
        PersistenceController.shared.save()
        
        showPopUp = false
        savesData.showPopUp = false
    }
    
    func closePopUp() {
        showPopUp = false
        savesData.showPopUp = false
    }
}

struct SavesView: View {
    var interactor: SavesBusinessLogic?
    @ObservedObject var savesData: SavesDataStore
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.dateTime)
    ]) var savedCalculus: FetchedResults<CalculusJson>
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var showPopUp = false
    
    init(savesData: SavesDataStore) {
        self.savesData = savesData
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Colors.quaternary.color)
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Colors.quaternary.color)
        ]
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ScrollWithBackgroundView(
                fillColor: Colors.quaternary.color.opacity(0.1),
                lottieAnimation: .caringMom
            ) {
                Spacer()
                    .frame(height: 100)
                
                if !savedCalculus.isEmpty {
                    ForEach(savedCalculus, id: \.dateTime) { savedCalculus in
                        if let calculus = savedCalculus.json?.toCalculus {
                            CardView(
                                babyName: savedCalculus.babyName,
                                calculus: calculus,
                                fontColor: .quaternary
                            )
                            .listRowBackground(Color.clear)
                            .padding(.bottom, .size02)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, .size20)
                } else {
                    EmptyListView(
                        titleText: .saveTitle,
                        emptyListText: .saveDescription,
                        textColor: .quaternary,
                        lottieAnimation: .emptyViewQuaternary
                    )
                }
                
                Spacer()
                    .frame(height: 100)
            }
            .popup(isPresented: $showPopUp) {
                SavePopUpView(
                    delegate: self,
                    savesData: savesData
                )
            } customize: {
                $0.closeOnTapOutside(true)
                    .closeOnTap(false)
                    .position(.top)
                    .animation(.easeInOut)
                    .isOpaque(true)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showPopUp = savesData.showPopUp
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(
                Text("Histórico")
            )
            .task {
                fetch()
            }
        }
    }
}

struct SavesView_Previews: PreviewProvider {
    static var previews: some View {
        return SavesView(savesData: SavesDataStore())
    }
}
