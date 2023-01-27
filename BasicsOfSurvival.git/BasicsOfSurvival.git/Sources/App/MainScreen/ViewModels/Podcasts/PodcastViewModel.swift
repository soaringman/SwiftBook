//
//  PodcastViewModel.swift
//  BasicsOfSurvival.git
//
//  Created by Kislov Vadim on 25.01.2023.
//

/// #Вью модель карточки подкаста
struct PodcastViewModel {
    /// Идентификатор подкаста
    var id: Int
    /// Название подкаста
    var podcastName: String
    /// URL подкаста в ВК
    var podcastUrl: String
    /// Длительность подкаста в секундах
    var podcastDuration: Int
    /// Название изображения
    var imageName: String?
    
    /// Преобразует длительность подкаста в подходящий формат (ч:м, м:c, c)
    var podcastDurationForLabel: String {
        switch podcastDuration {
        case 0..<60:
            return "\(podcastDuration)с"
        case 60..<3600:
            let minutes = podcastDuration / 60
            let seconds = podcastDuration % 60
                    
            return seconds == 0 ? "\(minutes)м" : "\(minutes)м \(seconds)с"
        default:
            let hours = podcastDuration / 3600
            let minutes = (podcastDuration - hours * 3600) / 60
                    
            return minutes == 0 ? "\(hours)ч" : "\(hours)ч \(minutes)м"
        }
    }
}
