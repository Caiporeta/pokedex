import 'package:pokedex/features/information/model/evolves_from.dart';
import 'package:pokedex/features/information/model/pokemon_variety.dart';
import 'package:pokedex/features/information/model/shape.dart';

import 'egg_group.dart';
import 'flavor_text.dart';

class PokemonInfo {
  int? baseHappiness;
  int? captureRate;
  List<EggGroup>? eggGroups;
  EvolutionChain? evolutionChain;
  EvolvesFrom? evolvesFromSpecies;
  List<FlavorText>? flavorTextEntries;
  bool? formsSwitchable;
  int? genderRate;
  EggGroup? generation;
  EggGroup? growthRate;
  EggGroup? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  int? order;
  List<PokemonVariety>? varieties;
  PokemonShape? shape;

  PokemonInfo(
      {this.baseHappiness,
      this.captureRate,
      this.eggGroups,
      this.evolutionChain,
      this.evolvesFromSpecies,
      this.flavorTextEntries,
      this.formsSwitchable,
      this.genderRate,
      this.generation,
      this.growthRate,
      this.habitat,
      this.hasGenderDifferences,
      this.hatchCounter,
      this.id,
      this.isBaby,
      this.isLegendary,
      this.isMythical,
      this.name,
      this.order,
      this.varieties,
      this.shape});

  PokemonInfo.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    if (json['egg_groups'] != null) {
      eggGroups = <EggGroup>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add(EggGroup.fromJson(v));
      });
    }
    evolutionChain = json['evolution_chain'] != null
        ? EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    evolvesFromSpecies = json['evolves_from_species'] != null
        ? EvolvesFrom.fromJson(json['evolves_from_species'])
        : null;

    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorText.fromJson(v));
      });
    }
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    generation = json['generation'] != null
        ? EggGroup.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? EggGroup.fromJson(json['growth_rate'])
        : null;
    habitat =
        json['habitat'] != null ? EggGroup.fromJson(json['habitat']) : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name'];
    order = json['order'];
    shape = json['shape'] != null ? PokemonShape.fromJson(json['shape']) : null;

    if (json['varieties'] != null) {
      varieties = <PokemonVariety>[];
      json['varieties'].forEach((v) {
        varieties!.add(PokemonVariety.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_happiness'] = baseHappiness;
    data['capture_rate'] = captureRate;
    if (eggGroups != null) {
      data['egg_groups'] = eggGroups!.map((v) => v.toJson()).toList();
    }
    if (evolutionChain != null) {
      data['evolution_chain'] = evolutionChain!.toJson();
    }
    data['evolves_from_species'] = evolvesFromSpecies;

    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    data['forms_switchable'] = formsSwitchable;
    data['gender_rate'] = genderRate;
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    if (growthRate != null) {
      data['growth_rate'] = growthRate!.toJson();
    }
    if (habitat != null) {
      data['habitat'] = habitat!.toJson();
    }
    data['has_gender_differences'] = hasGenderDifferences;
    data['hatch_counter'] = hatchCounter;
    data['id'] = id;
    data['is_baby'] = isBaby;
    data['is_legendary'] = isLegendary;
    data['is_mythical'] = isMythical;
    data['name'] = name;
    data['order'] = order;
    if (shape != null) {
      data['shape'] = shape!.toJson();
    }
    if (varieties != null) {
      data['varieties'] = varieties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EvolutionChain {
  String? url;

  EvolutionChain({this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
