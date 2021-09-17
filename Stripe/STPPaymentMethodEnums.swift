//
//  STPPaymentMethodEnums.swift
//  Stripe
//
//  Created by Yuki Tokuhiro on 3/12/19.
//  Copyright © 2019 Stripe, Inc. All rights reserved.
//

import Foundation

/// The type of the PaymentMethod.
@objc public enum STPPaymentMethodType: Int {
    /// A card payment method.
    case card
    /// An Alipay payment method.
    case alipay
    /// A GrabPay payment method.
    case grabPay
    /// An iDEAL payment method.
    @objc(STPPaymentMethodTypeiDEAL) case iDEAL
    /// An FPX payment method.
    case FPX
    /// A card present payment method.
    case cardPresent
    /// A SEPA Debit payment method.
    @objc(STPPaymentMethodTypeSEPADebit) case SEPADebit
    /// An AU BECS Debit payment method.
    @objc(STPPaymentMethodTypeAUBECSDebit) case AUBECSDebit
    /// A Bacs Debit payment method.
    case bacsDebit
    /// A giropay payment method.
    case giropay
    /// A Przelewy24 Debit payment method.
    case przelewy24
    /// An EPS payment method.
    @objc(STPPaymentMethodTypeEPS) case EPS
    /// A Bancontact payment method.
    case bancontact
    /// A NetBanking payment method.
    case netBanking
    /// An OXXO payment method.
    @objc(STPPaymentMethodTypeOXXO) case OXXO
    /// A Sofort payment method.
    case sofort
    /// A UPI payment method.
    case UPI
    /// A PayPal payment method. :nodoc:
    case payPal
    /// An AfterpayClearpay payment method
    case afterpayClearpay
    /// A BLIK payment method
    @objc(STPPaymentMethodTypeBLIK)
    case blik
    /// A WeChat Pay payment method
    case weChatPay
    /// A Boleto payment method.
    case boleto
    /// An unknown type.
    case unknown

    /// Localized display name for this payment method type
    var displayName: String {
        switch self {
        case .alipay:
            return STPLocalizedString("Alipay", "Payment Method type brand name")
        case .card:
            return STPLocalizedString("Card", "Payment Method for credit card")
        case .iDEAL:
            return STPLocalizedString("iDEAL", "Source type brand name")
        case .FPX:
            return STPLocalizedString("FPX", "Payment Method type brand name")
        case .SEPADebit:
            return STPLocalizedString("SEPA Debit", "Payment method brand name")
        case .AUBECSDebit:
            return STPLocalizedString("AU BECS Debit", "Payment Method type brand name.")
        case .grabPay:
            return STPLocalizedString("GrabPay", "Payment Method type brand name.")
        case .giropay:
            return STPLocalizedString("giropay", "Payment Method type brand name.")
        case .EPS:
            return STPLocalizedString("EPS", "Payment Method type brand name.")
        case .przelewy24:
            return STPLocalizedString("Przelewy24", "Payment Method type brand name.")
        case .bancontact:
            return STPLocalizedString("Bancontact", "Payment Method type brand name")
        case .netBanking:
            return STPLocalizedString("NetBanking", "Payment Method type brand name")
        case .OXXO:
            return STPLocalizedString("OXXO", "Payment Method type brand name")
        case .sofort:
            return STPLocalizedString("Sofort", "Payment Method type brand name")
        case .UPI:
            return STPLocalizedString("UPI", "Payment Method type brand name")
        case .payPal:
            return STPLocalizedString("PayPal", "Payment Method type brand name")
        case .afterpayClearpay:
            return Locale.current.regionCode == "GB"
            ? STPLocalizedString("Clearpay", "Payment Method type brand name")
            : STPLocalizedString("Afterpay", "Payment Method type brand name")
        case .blik:
            return STPLocalizedString("BLIK", "Payment Method type brand name")
        case .weChatPay:
            return STPLocalizedString("WeChat Pay", "Payment Method type brand name")
        case .boleto:
            return STPLocalizedString("Boleto", "Payment Method type brand name")
        case .bacsDebit,
            .cardPresent,
            .unknown:
            fallthrough
        @unknown default:
            return STPLocalizedString("Unknown", "Default missing source type label")
        }
    }
    
    /// Returns the set of payment requirements for the corresponding payment method
    var requirements: [PaymentMethodTypeRequirement] {
        switch self {
        case .card:
            return []
        case .alipay:
            return [.returnURL]
        case .grabPay:
            return [.returnURL]
        case .iDEAL:
            return [.returnURL]
        case .FPX:
            return [.returnURL]
        case .cardPresent:
            return []
        case .SEPADebit:
            return []
        case .AUBECSDebit:
            return []
        case .bacsDebit:
            return [.returnURL]
        case .giropay:
            return [.returnURL]
        case .przelewy24:
            return [.returnURL]
        case .EPS:
            return [.returnURL]
        case .bancontact:
            return [.returnURL]
        case .netBanking:
            return [.returnURL]
        case .OXXO:
            return []
        case .sofort:
            return [.returnURL]
        case .UPI:
            return []
        case .payPal:
            return [.returnURL]
        case .afterpayClearpay:
            return [.returnURL, .shippingAddress]
        case .blik:
            return []
        case .weChatPay:
            return []
        case .boleto:
            return []
        case .unknown:
            return []
        }
    }
    
    enum PaymentMethodTypeRequirement {
        /// Indicates that a payment method requires a return URL
        case returnURL
        
        /// Indicates that a payment method requires shipping information
        case shippingAddress
    }
}
