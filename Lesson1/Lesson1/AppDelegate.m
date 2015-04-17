//
//  AppDelegate.m
//  Lesson1
//
//  Created by Timur Bernikowich on 21.03.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Этот метод вызывается сразу же после запуска приложения.

    // Часть 1.
    // Создаем C-шный массив и номера двух студентов.
    NSLog(@"Часть 1");
    NSInteger numberOfPresentStudents = 5;
    NSInteger presentStudents[] = {1, 3, 7, 9, 10};
    NSInteger student1 = 6;
    NSInteger student2 = 9;

    // Проверяем были ли студенты на занятии.
    BOOL student1WasOnLesson = NO;
    for (NSInteger index = 0; index < numberOfPresentStudents; index++) {
        if (presentStudents[index] == student1) {
            student1WasOnLesson = YES;
            break;
        }
    }
    if (student1WasOnLesson) {
        NSLog(@"Студент %ld был на занятиях.", (long)student1);
    } else {
        NSLog(@"Студент %ld не был на занятиях.", (long)student1);
    }

    // То же самое для второго студента (только с другим циклом).
    BOOL student2WasOnLesson = NO;
    NSInteger index = 0;
    while (index < numberOfPresentStudents) {
        if (presentStudents[index] == student2) {
            student2WasOnLesson = YES;
            break;
        }
        index++;
    }
    if (student2WasOnLesson) {
        NSLog(@"Студент %ld был на занятиях.", (long)student2);
    } else {
        NSLog(@"Студент %ld не был на занятиях.", (long)student2);
    }

    // Часть 2.
    // Сложно не заметить, что код для первого и второго студента
    // практически одинаковый. Поэтому мы сейчас реализуем его через
    // метод. Метод 'printWithStudent:presentStudents:numberOfPresentStudents:'
    // находится чуть ниже, там же его описание.
    NSLog(@"Часть 2");
    // Метод вызываем у класса, а не у себя (не у self).
    // Получше, да?
    [AppDelegate printWithStudent:student1 presentStudents:presentStudents numberOfPresentStudents:numberOfPresentStudents];
    [AppDelegate printWithStudent:student2 presentStudents:presentStudents numberOfPresentStudents:numberOfPresentStudents];

    // Часть 3.
    // В папке Classes я создал класс Person. Для этого нужно зайти в File -> New -> File... -> Cocoa Class.
    // Там написать название и выбрать родительский класс - у меня это NSObject.
    // Теперь я сделал импорт (#import "Person.h") в этом файле - так этот класс узнает,
    // что есть класс Person, а также его интерфейс.
    NSLog(@"Часть 3");
    // Тут я показываю как работают разные конструкторы,
    // посмотреть и реализацию НУЖНО в Person.m, а интерфейс в Person.h.
    Person *defaultPerson = [[Person alloc] init];
    Person *myFriend = [[Person alloc] initWithLastName:@"Дыдышко" firstName:@"Дима" age:@(20)];
    Person *myAnotherFriend = [Person personWithLastName:@"Богданович" firstName:@"Катя" age:@(21)];
    // Создаю массив из них всех используя литералы (@[]).
    NSArray *people = @[defaultPerson, myFriend, myAnotherFriend];
    // У объекта NSArray (он же массив, объектный массив) есть параметр count
    // он возвращает кол. элементов.
    NSInteger peopleNumber = people.count;
    for (NSInteger index = 0; index < peopleNumber; index++) {
        Person *person = people[index];
        NSLog(@"%@", person);
    }

    // Это уже было в шаблоне метода.
    return YES;
}

+ (void)printWithStudent:(NSInteger)student presentStudents:(NSInteger *)presentStudents numberOfPresentStudents:(NSInteger)numberOfPresentStudents
{
    // 1. Перед названием этого метода знак '+' - это значит, что он вызывается
    // у класса (метод класса), а не у объекта.
    // 2. void - значит "ничего", т.е. метод ничего не возвращает.
    // 3. Если у метода несколько параметров, то они передаются через пробел
    // и название второго параметра. Пример: 'передвинутьОбъект:(Объект)о вХ:(CGFloat)x y:(CGFloat)y'.
    // 4. Мы передаем C-шный массив в метод по указателю.
    BOOL studentWasOnLesson = NO;
    for (NSInteger index = 0; index < numberOfPresentStudents; index++) {
        if (presentStudents[index] == student) {
            studentWasOnLesson = YES;
            break;
        }
    }
    if (studentWasOnLesson) {
        NSLog(@"Студент %ld был на занятиях.", (long)student);
    } else {
        NSLog(@"Студент %ld не был на занятиях.", (long)student);
    }
}

@end
