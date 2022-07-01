import 'dart:io';

class Car{
  Car(this.brand, this.model, this.year);

   String brand;
   String model;
   int year;
}
void main() {
  var _carList = [];
  bool Switch = true;

  while(Switch == true){
    print('Введите команду:');
    String command = stdin.readLineSync() ?? '';
    switch (command) {
      case "!help":
        print('Возможные команды');
        print('\t!show - показывает весь список');
        print('\t!add - добавляет машину в список');
        print('\t!delete - удаляет машину из списка');
        print('\t!clean - очищает весь список полностью');
        break;
      case '!show':
        for (int i = 0; i < _carList.length; i++){
          stdout.writeln('${i+1} ${_carList[i].brand} ${_carList[i].model} ${_carList[i].year}');
        }
        break;
      case '!add':     
        print('Введите марку машины, её модель и год выпуска');
        final brand = stdin.readLineSync() ?? '';   
        final model = stdin.readLineSync() ?? '';
        final year = int.tryParse(stdin.readLineSync() ?? '');
        final car = Car(brand, model, year!);
        _carList.add(car);
        print('\n');
        break;
      case '!delete':
        print('Введите id удаляемой машины c учётом нумерации с 0');
        var index = int.tryParse(stdin.readLineSync() ?? '');
        _carList.removeAt(index!);
        break;
      case '!clean':
        _carList.clear();
        break; 
      case '!sort by year':
        _carList.sort();
        break;
      case '!check in List':
        print('Введите информацию о машине, которую хотите проверить на вхождение в список');
        final brand = stdin.readLineSync() ?? '';   
        final model = stdin.readLineSync() ?? '';
        final year = int.tryParse(stdin.readLineSync() ?? '');
        final car = Car(brand, model, year!);
        _carList.contains(car);
        if (_carList.contains(car) == true){
          print('Данная машина есть в списке');
        }
        else{
          print('Данной машины нет в списке');
        }
        break;
      case '!exit':
        Switch = false; 
        break;  
    }
  }  
}






