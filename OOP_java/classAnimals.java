import java.util.ArrayList;

import java.util.List;

import java.util.Date;

import java.text.ParseException;

import java.text.SimpleDateFormat;





// Базовый класс Animal

abstract class Animal {

    protected String type;

    protected String name;

    protected Date birthDate;

    protected List<String> commands;



    public Animal(String type, String name, Date birthDate) {

        this.name = name;

        this.type = type;

        this.birthDate = new Date(birthDate.getTime());

        this.commands = new ArrayList<>();

    }





    public void addCommand(String command) {

        commands.add(command);

    }



    public void performCommands() {

        System.out.println(type + " " + name + " " + birthDate + " г.р. " + "выполняет команды: " + String.join(", ", commands));

    }



    // Геттеры

    public String getName() {

        return name;

    }



    public Date getBirthDate() {

        return new Date(birthDate.getTime());

    }

}



private static Date convertStringToDate(String dateString) {

    try {

        // Параметры формата даты

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        return formatter.parse(dateString);

    } catch (ParseException e) {

        e.printStackTrace();

        return new Date(); // Возвращаем текущую дату в случае ошибки

    }

}



// Подкласс Pet

abstract class Pet extends Animal {

    public Pet(String type, String name, Date birthDate) {

        super(type, name, birthDate);

    }

}



// Подкласс PackAnimal

abstract class PackAnimal extends Animal {

    public PackAnimal(String type, String name, Date birthDate) {

        super(type, name, birthDate);

    }

}







// Конкретные классы для домашних животных

class Dog extends Pet {

    public Dog(String type, String name, String birthDateString) {

        super(type, name, convertStringToDate(birthDateString));

    }

}



class Cat extends Pet {

    public Cat(String type, String name, String birthDateString) {

        super(type, name, convertStringToDate(birthDateString));

    }

}



class Hamster extends Pet {

    public Hamster(String type, String name, String birthDateString) {

        super(type, name, convertStringToDate(birthDateString));

    }

}



// Конкретные классы для вьючных животных

class Horse extends PackAnimal {

    public Horse(String type, String name, String birthDateString) {

        super(type, name, convertStringToDate(birthDateString));

    }

}



class Donkey extends PackAnimal {

    public Donkey(String type, String name, String birthDateString) {

        super(type, name, convertStringToDate(birthDateString));

    }

}



class Camel extends PackAnimal {

    public Camel(String type, String name, String birthDateString) {

        super(type, name, convertStringToDate(birthDateString));

    }



}



// Пример использования

public static class Main {

    public void main(String[] args) {

        Dog dog1 = new Dog("Собака", "Гриша", "2018-05-20");

        dog1.addCommand("Место");

        dog1.addCommand("Лежать");

        dog1.addCommand("Сидеть");



        Dog dog2 = new Dog("Собака",  "Ксюша", "2019-09-22");

        dog2.addCommand("Сидеть");

        dog2.addCommand("Тануй");

        dog2.addCommand("Голос");



        Dog dog3 = new Dog("Собака", "Лапа", "2020-05-18");

        dog3.addCommand("Место");

        dog3.addCommand("Фас");



        Dog dog4 = new Dog("Собака", "Римма", "2016-12-11");

        dog4.addCommand("Лапу");

        dog4.addCommand("Волчок");



        Dog dog5 = new Dog("Собака", "Миша", "2023-11-11");

        dog4.addCommand("Гулять");

        dog4.addCommand("Голос");



        Cat cat1 = new Cat("Кошка", "Линда", "2020-10-22");

        cat1.addCommand("Мурлыкать");

        cat1.addCommand("Спать");



        Cat cat2 = new Cat("Кот", "Барт", "2022-09-01");

        cat2.addCommand("На шкаф");

        cat2.addCommand("Петь");



        Cat cat3 = new Cat("Кошка", "Липа", "2019-01-23");

        cat3.addCommand("Убрать когти");

        cat3.addCommand("Ласка");



        Hamster hamster1 = new Hamster("Хомяк", "Хома", "2019-11-11");

        hamster1.addCommand("Колесо");

        hamster1.addCommand("Есть");

        hamster1.addCommand("Хрустеть");



        Hamster hamster2 = new Hamster("Хомяк", "Вася", "2021-06-24");

        hamster2.addCommand("Бегать");

        hamster2.addCommand("Прыгать");



        Hamster hamster3 = new Hamster("Хомяк", "Лаванда", "2023-03-23");

        hamster3.addCommand("Спинка");

        hamster3.addCommand("Шелестеть");



        Horse horse1 = new Horse("Конь", "Буран", "2019-07-04");

        horse1.addCommand("Галлоп");

        horse1.addCommand("Барьер");

        horse1.addCommand("Прыгать");



        Horse horse2 = new Horse("Конь", "Жак", "2018-11-23");

        horse2.addCommand("Аллюр");

        horse2.addCommand("Спать");



        Horse horse3 = new Horse("Конь", "Нарцисс", "2023-09-18");

        horse3.addCommand("Прогулка");

        horse3.addCommand("Стоянка");



        Donkey donkey1 = new Donkey("Осёл", "Мирон", "2023-09-18");

        donkey1.addCommand("Стоять");

        donkey1.addCommand("Вперёд");



        Donkey donkey2 = new Donkey("Ослица", "Дуня", "2018-12-12");

        donkey2.addCommand("Жевать");

        donkey2.addCommand("Грустить");



        Camel camel1 = new Camel("Верблюд", "Мак", "2021-09-29");

        camel1.addCommand("Жевать");

        camel1.addCommand("Прятаться");



        Camel camel2 = new Camel("Верблюд", "Шегер", "2019-08-249");

        camel2.addCommand("Гулять");

        camel2.addCommand("Копыто");



        // Выполнение команд

        dog1.performCommands();

        dog2.performCommands();

        dog3.performCommands();

        dog4.performCommands();

        dog5.performCommands();



        cat1.performCommands();

        cat2.performCommands();

        cat3.performCommands();



        hamster1.performCommands();

        hamster2.performCommands();

        hamster3.performCommands();



        horse1.performCommands();

        horse2.performCommands();

        horse3.performCommands();



        donkey1.performCommands();

        donkey2.performCommands();



        camel1.performCommands();

        camel2.performCommands();

    }



}