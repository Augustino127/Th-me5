import 'dart:io';

void main() {
  List<Map<String, dynamic>> taches = [];

  while (true) {
    print('\n1. Ajouter une tâche');
    print('2. Afficher les tâches');
    print('3. Modifier une tâche');
    print('4. Marquer une tâche accomplie');
    print('5. Supprimer une tâche');
    print('0. Quitter');

    String choix = stdin.readLineSync()!;

    if (choix == '0') {
      break;
    } else if (choix == '1') {
      stdout.write('Entrez la nouvelle tâche : ');
      String nouvelleTache = stdin.readLineSync()!;
      taches.add({'tache': nouvelleTache, 'accomplie': false});
    } else if (choix == '2') {
      if (taches.isEmpty) {
        print("Rien à afficher");
      }
      for (int i = 0; i < taches.length; i++) {
        var tache = taches[i];
        String statut = tache['accomplie'] ? '✅' : '❌';
        print('${i + 1}. [$statut] ${tache['tache']}');
      }
    } else if (choix == '3') {
      if (taches.isEmpty) {
        print("Rien à modifier entrez d'abord une tache");
      } else {
        stdout.write('Entrez le numéro de la tâche à modifier : ');
        int numero = int.parse(stdin.readLineSync()!);
        if (numero >= 1 && numero <= taches.length) {
          stdout.write('Entrez la nouvelle description de la tâche : ');
          String nouvelleDescription = stdin.readLineSync()!;
          taches[numero - 1]['tache'] = nouvelleDescription;
          print("Tache modifié avec succès");
        } else {
          print("Cette tache n'existe pas");
        }
      }
    } else if (choix == '4') {
      if (taches.isEmpty) {
        print("Aucune tache à marquer, ajoutez une tache !");
      } else {
        stdout
            .write('Entrez le numéro de la tâche à marquer comme accomplie : ');
        int numero = int.parse(stdin.readLineSync()!);
        if (numero >= 1 && numero <= taches.length) {
          taches[numero - 1]['accomplie'] = true;
          print("Tache accompli avec succès");
        } else {
          print("Cette tache n'existe pas !");
        }
      }
    } else if (choix == '5') {
      if (taches.isEmpty) {
        print("Rien à supprimer !");
      } else {
        stdout.write('Entrez le numéro de la tâche à supprimer : ');
        int numero = int.parse(stdin.readLineSync()!);
        if (numero >= 1 && numero <= taches.length) {
          taches.removeAt(numero - 1);
          print("Suppression réussi !");
        } else {
          print("Cette tache n'existe pas !");
        }
      }
    } else {
      print("Ce choix n'existe pas !");
    }
  }
}
