//
//  Model.swift
//  iOS10-HW14-Elena Zelenova
//
//  Created by Helena on 25.07.2023.
//

import Foundation

struct Model {
    let image: String
    let title: String
    let number: String
}

extension Model {
    
    func createModels() -> [[Model]] {
        return [
            [
                Model(image: "recents", title: "Недавние", number: "483"),
                Model(image: "favourites", title: "Избранное", number: "56"),
                Model(image: "friends", title: "Друзья", number: "78"),
                Model(image: "trips", title: "Поездки", number: "100"),
                Model(image: "vacation", title: "Отпуск", number: "123"),
                Model(image: "work", title: "Работа", number: "9"),
                Model(image: "trip", title: "Путешествие", number: "6"),
                Model(image: "Bali", title: "Бали", number: "5"),
            ],
            [
                Model(image: "cat", title: "Моя кошка", number: "55"),
                Model(image: "dog", title: "Моя собака", number: "20"),
                Model(image: "sport", title: "Спорт", number: "3"),
                Model(image: "food", title: "Рецепты", number: "12")
            ],
            [
                Model(image: "video", title: "Видео", number: "400"),
                Model(image: "person.crop.square", title: "Селфи", number: "4"),
                Model(image: "livephoto", title: "Фото Live Photos", number: "300"),
                Model(image: "cube", title: "Портреты", number: "57"),
                Model(image: "pano", title: "Панорамы", number: "5"),
                Model(image: "square.stack.3d.down.right", title: "Серии", number: "4")
            ],
            [
                Model(image: "square.stack.3d.forward.dottedline", title: "Анимированные", number: "44"),
                Model(image: "square.and.arrow.down", title: "Импортированные", number: "2"),
                Model(image: "eye.slash", title: "Скрытые", number: "3"),
                Model(image: "trash", title: "Недавно удаленные", number: "1200")
            ]
        ]
    }
}