//
//  ContentView.swift
//  ai_practice_plans_swiftui
//
//  Created by Tony Zatelli on 3/29/23.
//

import SwiftUI

struct ContentView: View {
//    enum FootballFocusAreas {
//        case Blocking, Catching, RouteRunning, Passing, Tackling, ManCoverage, ZoneCoverage, SpecialTeams
//
//        var description: String {
//            get {
//                switch self {
//                case .RouteRunning:
//                    return "Route Running"
//                case .ManCoverage:
//                    return "Man Coverage"
//                case .ZoneCoverage:
//                    return "Zone Coverage"
//                case .SpecialTeams:
//                    return "Special Teams"
//                default:
//                    return "\(self)"
//                }
//            }
//        }
//    }
    @State private var practiceOptions: [PracticeFocusOption] = []

    var body: some View {
        NavigationStack {
            Form {
                Section("General") {
                    ForEach(practiceOptions.filter({$0.section == .General})) { option in
                        Toggle(option.label, isOn: option.$isToggled)
                    }
                }

                Section("Offense") {
                    ForEach(practiceOptions.filter({$0.section == .Offense})) { option in
                        Toggle(option.label, isOn: option.$isToggled)
                    }
                }

                Section("Defense") {
                    ForEach(practiceOptions.filter({$0.section == .Defense})) { option in
                        Toggle(option.label, isOn: option.$isToggled)
                    }
                }

                Section("Special Teams") {
                    ForEach(practiceOptions.filter({$0.section == .SpecialTeams})) { option in
                        Toggle(option.label, isOn: option.$isToggled)
                    }
                }

                Section {
                    Button {
                        queryAI()
                    } label: {
                        HStack {
                            Text("Generate!")
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                    }

                }
                .listRowBackground(Color.clear)
            }
        }
        .navigationTitle("Generate Practice Plan")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            practiceOptions = loadOptions()
        }

    }

    func queryAI() {
        var areasOfFocus: [String] = []

        // 1. Pull out options that are toggled on from the main array.
        // 2. Send strings off to ChatGPT
        // 3. PROFIT!


    }

    func loadOptions() -> [PracticeFocusOption] {
        // in Prod these would come from a database or API call
        var options: [PracticeFocusOption] = []
        options.append(PracticeFocusOption(label: "Conditioning", section: .General))

        options.append(PracticeFocusOption(label: "Passing", section: .Offense))
        options.append(PracticeFocusOption(label: "Catching", section: .Offense))
        options.append(PracticeFocusOption(label: "Route Running", section: .Offense))
        options.append(PracticeFocusOption(label: "Blocking", section: .Offense))

        options.append(PracticeFocusOption(label: "Tackling", section: .Defense))
        options.append(PracticeFocusOption(label: "Man Coverage", section: .Defense))
        options.append(PracticeFocusOption(label: "Zone Coverage", section: .Defense))

        options.append(PracticeFocusOption(label: "Field Goal", section: .SpecialTeams))
        options.append(PracticeFocusOption(label: "Field Goal Defend", section: .SpecialTeams))
        options.append(PracticeFocusOption(label: "Punt", section: .SpecialTeams))
        options.append(PracticeFocusOption(label: "Punt Defend", section: .SpecialTeams))
        options.append(PracticeFocusOption(label: "Kickoff", section: .SpecialTeams))
        options.append(PracticeFocusOption(label: "Kickoff Defend", section: .SpecialTeams))

        return options
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
