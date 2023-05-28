//
//  ConfigurationInteractor.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import Foundation
import StoreKit

enum Coffee: String, CaseIterable {
    case tip1
    case tip2
    case tip3
    case tip4
    case tip5
    
    var title: String {
        switch self {
        case .tip1:
            return "1 xícara ☕️"
        case .tip2:
            return "2 xícaras ☕️"
        case .tip3:
            return "1 café chique ☕️"
        case .tip4:
            return "2 cafés chiques ☕️"
        case .tip5:
            return "Café da Sereia 🧜‍♀️"
        }
    }
}

struct CoffeeProduct {
    let title: String
    let price: String
    let coffee: Coffee
}

protocol ConfigurationBusinessLogic {
    func fetchTips(request: ConfigurationModel.LoadConfiguration.Request)
    func purchase(request: ConfigurationModel.PurchaseTips.Request)
}

final class ConfigurationInteractor: NSObject {
    typealias LoadRequest = CegonhaAdiantada.ConfigurationModel.LoadConfiguration.Request
    typealias PaymentRequest = CegonhaAdiantada.ConfigurationModel.PurchaseTips.Request
    typealias Response = CegonhaAdiantada.ConfigurationModel.LoadConfiguration.Response
    var presenter: ConfigurationPresentationLogic?
    var coffees = [SKProduct]()
    var skPaymentQueue = SKPaymentQueue.default()
}

extension ConfigurationInteractor: ConfigurationBusinessLogic {
    func purchase(request: PaymentRequest) {
        guard SKPaymentQueue.canMakePayments() else { return }
        
        guard let storeKitProduct = coffees.first(where: { $0.productIdentifier == request.coffee.rawValue }) else {
            return
        }
        
        let paymentRequest = SKPayment(product: storeKitProduct)
        skPaymentQueue.add(self)
        skPaymentQueue.add(paymentRequest)
    }
    
    func fetchTips(request: LoadRequest) {
        let request = SKProductsRequest(productIdentifiers:
            Set(Coffee.allCases.compactMap{ $0.rawValue })
        )
        request.delegate = self
        request.start()
    }
}

// MARK: SKProductsRequestDelegate
extension ConfigurationInteractor: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        transactions.forEach { payment in
            switch payment.transactionState {
            case .purchased:
                presenter?.thanksAlert()
                skPaymentQueue.finishTransaction(payment)
                skPaymentQueue.remove(self)
            default:
                break
            }
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("🚧 \(response.products)")
        self.coffees = response.products
        
        let coffeesProducts: [CoffeeProduct] = coffees.compactMap { product in
            guard let coffeeEnum = Coffee(rawValue: product.productIdentifier),
                  let price = product.localizedPrice else { return nil }
            
            
            return CoffeeProduct(title: coffeeEnum.title, price: price, coffee: coffeeEnum)
        }
        presenter?.present(response: Response(coffees: coffeesProducts))
    }
}

extension SKProduct {
    var localizedPrice: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)
    }
}
