//
//  GlucoseAlert.swift
//  GlucoseDirect
//

import Combine
import Foundation
import UIKit
import UserNotifications

func glucoseNotificationMiddelware() -> Middleware<DirectState, DirectAction> {
    return glucoseNotificationMiddelware(service: LazyService<GlucoseNotificationService>(initialization: {
        GlucoseNotificationService()
    }))
}

private func glucoseNotificationMiddelware(service: LazyService<GlucoseNotificationService>) -> Middleware<DirectState, DirectAction> {
    return { state, action, _ in
        switch action {
        case .setHighGlucoseAlarmSound(sound: let sound):
            if sound == .none {
                service.value.clear()
            }

        case .setLowGlucoseAlarmSound(sound: let sound):
            if sound == .none {
                service.value.clear()
            }

        case .setGlucoseNotification(enabled: let enabled):
            if !enabled {
                service.value.clear()
            }

        case .setGlucoseUnit(unit: let unit):
            break
//            guard let glucose = state.latestSensorGlucose else {
//                break
//            }
//
//            service.value.setGlucoseNotification(glucose: glucose, glucoseUnit: unit)

        case .addSensorGlucose(glucoseValues: let glucoseValues):
            guard let glucose = glucoseValues.last else {
                break
            }

            var isSnoozed = false
            if let snoozeUntil = state.alarmSnoozeUntil, Date() < snoozeUntil {
                isSnoozed = true
            }

            DirectLog.info("isSnoozed: \(isSnoozed)")

            if glucose.glucoseValue < state.alarmLow {
                DirectLog.info("Glucose alert, low: \(glucose.glucoseValue) < \(state.alarmLow)")

                if !isSnoozed {
                    if state.glucoseNotification {
                        service.value.setLowGlucoseNotification(glucose: glucose, glucoseUnit: state.glucoseUnit)
                    }

                    if state.hasLowGlucoseAlarm {
                        service.value.setLowGlucoseAlarm(ignoreMute: state.ignoreMute, sound: state.lowGlucoseAlarmSound)
                    }

                    return Just(.setAlarmSnoozeUntil(untilDate: Date().addingTimeInterval(5 * 60).toRounded(on: 1, .minute), autosnooze: true))
                        .setFailureType(to: AppError.self)
                        .eraseToAnyPublisher()
                }

            } else if glucose.glucoseValue > state.alarmHigh {
                DirectLog.info("Glucose alert, high: \(glucose.glucoseValue) > \(state.alarmHigh)")

                if !isSnoozed {
                    if state.glucoseNotification {
                        service.value.setHighGlucoseNotification(glucose: glucose, glucoseUnit: state.glucoseUnit)
                    }

                    if state.hasHighGlucoseAlarm {
                        service.value.setHighGlucoseAlarm(ignoreMute: state.ignoreMute, sound: state.highGlucoseAlarmSound)
                    }

                    return Just(.setAlarmSnoozeUntil(untilDate: Date().addingTimeInterval(5 * 60).toRounded(on: 1, .minute), autosnooze: true))
                        .setFailureType(to: AppError.self)
                        .eraseToAnyPublisher()
                }
                
            } else if state.glucoseNotification {
                service.value.setGlucoseNotification(glucose: glucose, glucoseUnit: state.glucoseUnit)
            } else {
                service.value.clear()
            }

        default:
            break
        }

        return Empty().eraseToAnyPublisher()
    }
}

// MARK: - GlucoseNotificationService

private class GlucoseNotificationService {
    // MARK: Lifecycle

    init() {
        DirectLog.info("Create GlucoseNotificationService")
    }

    // MARK: Internal

    enum Identifier: String {
        case sensorGlucoseAlarm = "libre-direct.notifications.sensor-glucose-alarm"
    }

    func clear() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [Identifier.sensorGlucoseAlarm.rawValue])
    }

    func setGlucoseNotification(glucose: SensorGlucose, glucoseUnit: GlucoseUnit) {
        DirectNotifications.shared.ensureCanSendNotification { state in
            DirectLog.info("Glucose info, state: \(state)")

            guard state != .none else {
                return
            }

            let notification = UNMutableNotificationContent()
            notification.sound = .none
            notification.interruptionLevel = .passive

            if glucoseUnit == .mgdL {
                notification.badge = glucose.glucoseValue as NSNumber
            } else {
                notification.badge = glucose.glucoseValue.asRoundedMmolL as NSNumber
            }

            notification.title = String(format: LocalizedString("Blood glucose: %1$@"), glucose.glucoseValue.asGlucose(unit: glucoseUnit, withUnit: true))
            notification.body = String(format: LocalizedString("Your current glucose is %1$@ (%2$@)."),
                                       glucose.glucoseValue.asGlucose(unit: glucoseUnit, withUnit: true),
                                       glucose.minuteChange?.asMinuteChange(glucoseUnit: glucoseUnit) ?? "?"
            )

            DirectNotifications.shared.add(identifier: Identifier.sensorGlucoseAlarm.rawValue, content: notification)
        }
    }

    func setLowGlucoseAlarm(ignoreMute: Bool, sound: NotificationSound) {
        DirectNotifications.shared.playSound(ignoreMute: ignoreMute, sound: sound)
    }

    func setLowGlucoseNotification(glucose: SensorGlucose, glucoseUnit: GlucoseUnit) {
        DirectNotifications.shared.ensureCanSendNotification { state in
            DirectLog.info("Glucose alert, state: \(state)")

            guard state != .none else {
                return
            }

            let notification = UNMutableNotificationContent()
            notification.sound = .none
            notification.userInfo = self.actions
            notification.interruptionLevel = .timeSensitive

            if glucoseUnit == .mgdL {
                notification.badge = glucose.glucoseValue as NSNumber
            } else {
                notification.badge = glucose.glucoseValue.asRoundedMmolL as NSNumber
            }

            notification.title = LocalizedString("Alert, low blood glucose")
            notification.body = String(format: LocalizedString("Your glucose %1$@ (%2$@) is dangerously low. With sweetened drinks or dextrose, blood glucose levels can often return to normal."),
                                       glucose.glucoseValue.asGlucose(unit: glucoseUnit, withUnit: true),
                                       glucose.minuteChange?.asMinuteChange(glucoseUnit: glucoseUnit) ?? "?"
            )

            DirectNotifications.shared.add(identifier: Identifier.sensorGlucoseAlarm.rawValue, content: notification)
        }
    }

    func setHighGlucoseAlarm(ignoreMute: Bool, sound: NotificationSound) {
        DirectNotifications.shared.playSound(ignoreMute: ignoreMute, sound: sound)
    }

    func setHighGlucoseNotification(glucose: SensorGlucose, glucoseUnit: GlucoseUnit) {
        DirectNotifications.shared.ensureCanSendNotification { state in
            DirectLog.info("Glucose alert, state: \(state)")

            guard state != .none else {
                return
            }

            let notification = UNMutableNotificationContent()
            notification.sound = .none
            notification.userInfo = self.actions
            notification.interruptionLevel = .timeSensitive

            if glucoseUnit == .mgdL {
                notification.badge = glucose.glucoseValue as NSNumber
            } else {
                notification.badge = glucose.glucoseValue.asRoundedMmolL as NSNumber
            }

            notification.title = LocalizedString("Alert, high glucose")
            notification.body = String(format: LocalizedString("Your glucose %1$@ (%2$@) is dangerously high and needs to be treated."),
                                       glucose.glucoseValue.asGlucose(unit: glucoseUnit, withUnit: true),
                                       glucose.minuteChange?.asMinuteChange(glucoseUnit: glucoseUnit) ?? "?"
            )

            DirectNotifications.shared.add(identifier: Identifier.sensorGlucoseAlarm.rawValue, content: notification)
        }
    }

    // MARK: Private

    private let actions: [AnyHashable: Any] = [
        "action": "snooze"
    ]
}

private extension Int {
    var asRoundedMmolL: Double {
        let value = Double(self) * GlucoseUnit.exchangeRate
        let divisor = pow(10.0, Double(1))

        return round(value * divisor) / divisor
    }
}
