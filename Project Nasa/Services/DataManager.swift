//
//  DataManager.swift
//  Project Nasa
//
//  Created by SummeR on 30.04.2021.
//

struct DataManager {
    
    static var shared = DataManager()
    
    let url = "https://api.nasa.gov/planetary/apod?count=5&api_key=z0owduoN1oOCl08yr0r6xd1rTHCWRbFLz7TXkhFa"
    let descriptionText = "Один из самых популярных веб-сайтов NASA - Astronomy Picture of the Day. Фактически, этот сайт - один из самых популярных во всех федеральных агентствах. Он популярнее видео Джастина Бибера. Этот сайт структурирует изображения APOD и связанные с ними метаданные. Откройте для себя космос! Каждый день появляется новое изображение или фотография нашей увлекательной вселенной, а также краткое объяснение, написанное профессиональным астрономом."
    let nasaLogo = "nasaLogo"
    
    private init() {}
}
