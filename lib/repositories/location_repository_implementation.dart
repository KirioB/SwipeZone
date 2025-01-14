import 'package:swipezone/repositories/location_repository.dart';
import 'package:swipezone/repositories/models/categories.dart';
import 'package:swipezone/repositories/models/localization.dart';
import 'package:swipezone/repositories/models/location.dart';

class ILocationRepository implements LocationRepository {
  @override
  Future<List<Location>> getLocations() {
    return Future.value([
      Location(
        nom: "Tour Eiffel",
        description:
            "La Tour Eiffel est un monument emblématique de Paris, construit en 1889.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/a/a8/Tour_Eiffel_Wikimedia_Commons.jpg",
        category: Categories.Tower,
        activities: null,
        localization: Localization(
            "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
            48.8584,
            2.2945),
      ),
      Location(
        nom: "Louvre",
        description:
            "Le Louvre est le plus grand musée d'art du monde, abritant la Joconde.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/e/e6/Louvre_Museum_Wikimedia_Commons.jpg",
        category: Categories.Museum,
        activities: null,
        localization:
            Localization("Rue de Rivoli, 75001 Paris", 48.8606, 2.3376),
      ),
      Location(
        nom: "Cathédrale Notre-Dame",
        description:
            "La cathédrale gothique Notre-Dame est située sur l'île de la Cité.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/a/a6/Notre_Dame_de_Paris_Wikimedia_Commons.jpg",
        category: Categories.Church,
        activities: null,
        localization: Localization(
            "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris",
            48.8529,
            2.3508),
      ),
      Location(
        nom: "Arc de Triomphe",
        description:
            "Construit pour honorer les victoires de Napoléon, il est situé sur la place de l'Étoile.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/6/6b/Arc_de_Triomphe_Wikimedia_Commons.jpg",
        category: Categories.HistoricalSite,
        activities: null,
        localization: Localization(
            "Place Charles de Gaulle, 75008 Paris", 48.8738, 2.295),
      ),
      Location(
        nom: "Sacré-Cœur",
        description:
            "La basilique du Sacré-Cœur est un symbole religieux de Montmartre.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/5/53/Sacre_Coeur_Wikimedia_Commons.jpg",
        category: Categories.Church,
        activities: null,
        localization: Localization(
            "35 Rue du Chevalier de la Barre, 75018 Paris", 48.8867, 2.3431),
      ),
      Location(
        nom: "Panthéon",
        description:
            "Le Panthéon est un mausolée pour les grandes figures françaises.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/3/3b/Panth%C3%A9on_Wikimedia_Commons.jpg",
        category: Categories.HistoricalSite,
        activities: null,
        localization:
            Localization("Place du Panthéon, 75005 Paris", 48.8462, 2.3449),
      ),
      Location(
        nom: "Place de la Concorde",
        description:
            "La plus grande place de Paris, connue pour son obélisque et ses fontaines.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/8/84/Place_de_la_Concorde_Wikimedia_Commons.jpg",
        category: Categories.HistoricalSite,
        activities: null,
        localization:
            Localization("Place de la Concorde, 75008 Paris", 48.8656, 2.3212),
      ),
      Location(
        nom: "Palais Garnier",
        description:
            "L'Opéra Garnier est une somptueuse salle de spectacle datant du XIXe siècle.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/5/51/Op%C3%A9ra_Garnier_Wikimedia_Commons.jpg",
        category: Categories.Museum,
        activities: null,
        localization:
            Localization("Place de l'Opéra, 75009 Paris", 48.8719, 2.3316),
      ),
      Location(
        nom: "Jardin des Tuileries",
        description:
            "Le jardin des Tuileries est un jardin public historique situé près du Louvre.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/a/a6/Jardin_des_Tuileries_Wikimedia_Commons.jpg",
        category: Categories.Park,
        activities: null,
        localization:
            Localization("113 Rue de Rivoli, 75001 Paris", 48.8636, 2.3276),
      ),
      Location(
        nom: "Pont Alexandre III",
        description:
            "Ce pont richement orné relie les Champs-Élysées et les Invalides.",
        schedule: null,
        contact: null,
        photoUrl:
            "https://upload.wikimedia.org/wikipedia/commons/5/5c/Pont_Alexandre_III_Wikimedia_Commons.jpg",
        category: Categories.HistoricalSite,
        activities: null,
        localization:
            Localization("Pont Alexandre III, 75008 Paris", 48.8654, 2.3131),
      ),
    ]);
  }
}
