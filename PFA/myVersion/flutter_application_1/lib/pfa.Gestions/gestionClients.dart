
import 'package:flutter_application_1/pfa.classes/Compte.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../pfa.classes/Client.dart';

class GestionClient {
  List<Client> clients;

  GestionClient({required this.clients});

  // void addClient(Client client) {
  //   clients.add(client);
  // }

  // void deleteClient(int id) {
  //   clients.removeWhere((client) => client.id == id);
  // }

  Client? searchClient(int id) {
    for (var client in clients) {
      if (client.id == id) {
        return client;
      }
    }
    return null;
  }

}



