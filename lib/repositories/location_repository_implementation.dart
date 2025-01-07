import 'package:swipezone/repositories/location_repository.dart';
import 'package:swipezone/repositories/models/categories.dart';
import 'package:swipezone/repositories/models/localization.dart';
import 'package:swipezone/repositories/models/location.dart';

class ILocationRepository implements LocationRepository {
  @override
  Future<List<Location>> getLocations() {
    return Future.value([
      Location(
        "Tour Eiffel",
        "La Tour Eiffel est un monument emblématique de Paris, construit en 1889.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg",
        Categories.Tower,
        null,
        Localization("Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
            48.8584, 2.2945),
      ),
      Location(
        "Louvre",
        "Le Louvre est le plus grand musée d'art du monde, abritant la Joconde.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/e/e6/Louvre_Museum_Wikimedia_Commons.jpg",
        Categories.Museum,
        null,
        Localization("Rue de Rivoli, 75001 Paris", 48.8606, 2.3376),
      ),
      Location(
        "Cathédrale Notre-Dame",
        "La cathédrale gothique Notre-Dame est située sur l'île de la Cité.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/a/a6/Notre_Dame_de_Paris_Wikimedia_Commons.jpg",
        Categories.Church,
        null,
        Localization("6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris",
            48.8529, 2.3508),
      ),
      Location(
        "Arc de Triomphe",
        "Construit pour honorer les victoires de Napoléon, il est situé sur la place de l'Étoile.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/6/6b/Arc_de_Triomphe_Wikimedia_Commons.jpg",
        Categories.HistoricalSite,
        null,
        Localization("Place Charles de Gaulle, 75008 Paris", 48.8738, 2.295),
      ),
      Location(
        "Sacré-Cœur",
        "La basilique du Sacré-Cœur est un symbole religieux de Montmartre.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/5/53/Sacre_Coeur_Wikimedia_Commons.jpg",
        Categories.Church,
        null,
        Localization(
            "35 Rue du Chevalier de la Barre, 75018 Paris", 48.8867, 2.3431),
      ),
      Location(
        "Panthéon",
        "Le Panthéon est un mausolée pour les grandes figures françaises.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/3/3b/Panth%C3%A9on_Wikimedia_Commons.jpg",
        Categories.HistoricalSite,
        null,
        Localization("Place du Panthéon, 75005 Paris", 48.8462, 2.3449),
      ),
      Location(
        "Place de la Concorde",
        "La plus grande place de Paris, connue pour son obélisque et ses fontaines.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/8/84/Place_de_la_Concorde_Wikimedia_Commons.jpg",
        Categories.HistoricalSite,
        null,
        Localization("Place de la Concorde, 75008 Paris", 48.8656, 2.3212),
      ),
      Location(
        "Palais Garnier",
        "L'Opéra Garnier est une somptueuse salle de spectacle datant du XIXe siècle.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/5/51/Op%C3%A9ra_Garnier_Wikimedia_Commons.jpg",
        Categories.Museum,
        null,
        Localization("Place de l'Opéra, 75009 Paris", 48.8719, 2.3316),
      ),
      Location(
        "Jardin des Tuileries",
        "Le jardin des Tuileries est un jardin public historique situé près du Louvre.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/a/a6/Jardin_des_Tuileries_Wikimedia_Commons.jpg",
        Categories.Park,
        null,
        Localization("113 Rue de Rivoli, 75001 Paris", 48.8636, 2.3276),
      ),
      Location(
        "Pont Alexandre III",
        "Ce pont richement orné relie les Champs-Élysées et les Invalides.",
        null,
        null,
        "https://upload.wikimedia.org/wikipedia/commons/5/5c/Pont_Alexandre_III_Wikimedia_Commons.jpg",
        Categories.HistoricalSite,
        null,
        Localization("Pont Alexandre III, 75008 Paris", 48.8654, 2.3131),
      ),
    ]);
  }
}
