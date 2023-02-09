//
//  ViewController.swift
//  TheatreCompany
//
//  Created by Jess Le on 2/8/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var statementView: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        if let invoices = getInvoices(), let firstInvoice = invoices.first, let plays = getPlays() {
            label.text = statement(invoice: firstInvoice, plays: plays)
        } else {
            label.text = "Failed to get Statements!!"
        }
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(statementView)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            statementView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statementView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func getInvoices() -> Invoices? {
        guard let data = FakeJSONLoader.loadFile(for: "Invoices"),
              let response = try? JSONDecoder().decode(Invoices.self, from: data)
        else {
            return nil
        }
        return response
    }

    func getPlays() -> Plays? {
        guard let data = FakeJSONLoader.loadFile(for: "Plays"),
              let response = try? JSONDecoder().decode(Plays.self, from: data)
        else {
            return nil
        }
        return response
    }

    func statement(invoice: Invoice, plays: Plays) -> String {
        var totalAmount = 0
        var volumeCredits = 0
        var result = "Statement for \(invoice.customer)\n"
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "USD"
        format.minimumFractionDigits = 2

        for perf in invoice.performances {
            let play = plays.play
            var thisAmount = 0

            switch play.type {
            case "tragedy":
                thisAmount = 40000
                if perf.audience > 30 {
                    thisAmount += 1000 * (perf.audience - 30)
                }
            case "comedy":
                thisAmount = 30000
                if perf.audience > 20 {
                    thisAmount += 10000 + 500 * (perf.audience - 20)
                }
                thisAmount += 300 * (perf.audience)
            default:
                fatalError("unknown type: \(play.type)")
            }

            volumeCredits += max(perf.audience - 30, 0)
            if play.type == "comedy" {
                volumeCredits += Int(floor(Double(perf.audience) / 5.0))
            }

            result += "  \(play.name): \(format.string(from: NSNumber(value: Double(thisAmount) / 100.0))!) (\(perf.audience) seats)\n"
            totalAmount += thisAmount
        }
        result += "Amount owed is \(format.string(from: NSNumber(value: Double(totalAmount) / 100.0))!)\n"
        result += "You earned \(volumeCredits) credits\n"
        return result
    }
}
