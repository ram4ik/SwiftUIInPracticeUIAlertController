//
//  ContentView.swift
//  SwiftUIInPracticeUIAlertController
//
//  Created by ramil on 17.03.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Button(action: {
                self.presentTextFieldAlertController()
            }) {
                Text("Show alert")
            }
            Divider()
            Text("Text: \(text)")
        }
    }
    
    private func presentTextFieldAlertController() {
        if let rootViewController = UIApplication.shared.windows[0].rootViewController {
            rootViewController.present(textFieldAlertController(), animated: true, completion: nil)
        }
    }
    
    private func textFieldAlertController() -> UIAlertController {
        let textFieldAlertController = UIAlertController(title: "Save text", message: nil, preferredStyle: .alert)
        
        textFieldAlertController.addTextField()
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: nil)
        
        let saveAction = UIAlertAction(title: NSLocalizedString("Save", comment: "Save"), style: .default) { (alertAction) in
            
            self.text = textFieldAlertController.textFields![0].text ?? ""
        }
        
        textFieldAlertController.addAction(cancelAction)
        textFieldAlertController.addAction(saveAction)
        
        return textFieldAlertController
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
