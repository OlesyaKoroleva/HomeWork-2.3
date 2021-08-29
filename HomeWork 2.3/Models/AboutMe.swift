//
//  AboutMe.swift
//  HomeWork 2.4
//
//  Created by Olesya Koroleva on 29.08.2021.
//


struct User {
    let login = "User"
    let password = "Password"
    let person: Person
    
    static func getUser() -> User {
        let person = Person(
            firstName: "Olesya",
            lastName: "Koroleva",
            aboutMe: """
                Мне 31 год, я мама в декрете, у меня есть замечательная дочка 2-х лет
            и любимый муж.
            По образованию: инженер в строительстве.
            Ранее я работала в бухгалтерии, в строительстве, в охране труда.
            Живу в Москве 5 лет, приехала из Новосибирска.
            Люблю кататься на сноуборде, путешествовать и вкусно поесть.
            """,
            photo: "MePhoto"
        )
        let user = User(person: person)
        return user
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let aboutMe: String
    let photo: String
}








