//
//  PracticeFocusOption.swift
//  ai_practice_plans_swiftui
//
//  Created by Tony Zatelli on 3/29/23.
//

import Foundation
import SwiftUI

struct PracticeFocusOption: Identifiable {
    enum PracticeFocusSection {
        case General, Offense, Defense, SpecialTeams
    }

    var id: UUID = UUID()
    var label: String
    @State var isToggled: Bool = false
    var section: PracticeFocusSection
}
