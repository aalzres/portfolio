//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 10/12/21.
//

import Foundation

extension String {
    public var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension String {
    public func localizedWith(
        tableName: String? = nil,
        bundle: Bundle = Bundle.main,
        value: String = "",
        comment: String = "",
        args: CVarArg...
    ) -> String {
        String(
            format: NSLocalizedString(self, tableName: tableName, bundle: bundle, comment: comment),
            arguments: args
        )
    }
}
