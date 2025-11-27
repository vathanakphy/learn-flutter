class Joke {
  final String title;
  final String description;

  Joke({
    required this.title,
    required this.description,
  });
}

List<Joke> loadJokes() {
  return [
    Joke(
      title: "Atoms Don't Lie",
      description:
          "Why don't scientists trust atoms? Because they make up everything!",
    ),
    Joke(
      title: "Computer Break",
      description:
          "I told my computer I needed a break, and it said 'No problem – I'll go to sleep.'",
    ),
    Joke(
      title: "Outstanding Scarecrow",
      description: "Why did the scarecrow win an award? Because he was outstanding in his field!",
    ),
    Joke(
      title: "No Guts",
      description: "Why don’t skeletons fight each other? They don’t have the guts.",
    ),
    Joke(
      title: "UDP Joke",
      description: "I would tell you a joke about UDP, but you might not get it.",
    ),
    Joke(
      title: "Tired Bicycle",
      description: "Why did the bicycle fall over? Because it was two-tired!",
    ),
    Joke(
      title: "Parallel Lines",
      description:
          "Parallel lines have so much in common… it’s a shame they’ll never meet.",
    ),
    Joke(
      title: "Nature Bugs",
      description: "Why don’t programmers like nature? Too many bugs.",
    ),
    Joke(
      title: "Surprised Eyebrows",
      description:
          "I told my wife she was drawing her eyebrows too high. She looked surprised.",
    ),
    Joke(
      title: "Sad Math Book",
      description: "Why did the math book look sad? Because it had too many problems.",
    ),
    Joke(
      title: "Silent P",
      description:
          "Why can’t you hear a pterodactyl go to the bathroom? Because the 'P' is silent.",
    ),
    Joke(
      title: "Moon Restaurant",
      description:
          "Did you hear about the restaurant on the moon? Great food, no atmosphere.",
    ),
    Joke(
      title: "Mugged Coffee",
      description: "Why did the coffee file a police report? It got mugged.",
    ),
    Joke(
      title: "Cold Computer",
      description: "Why was the computer cold? It left its Windows open.",
    ),
    Joke(
      title: "Paranoid Books",
      description:
          "I asked the librarian if books about paranoia were available. She whispered, 'They're right behind you…'",
    ),
    Joke(
      title: "Blushing Tomato",
      description:
          "Why did the tomato turn red? Because it saw the salad dressing!",
    ),
    Joke(
      title: "Fake Spaghetti",
      description: "What do you call fake spaghetti? An impasta.",
    ),
    Joke(
      title: "Crummy Cookie",
      description: "Why did the cookie go to the doctor? Because it felt crummy.",
    ),
    Joke(
      title: "Golf Pants",
      description:
          "Why did the golfer bring two pairs of pants? In case he got a hole in one.",
    ),
    Joke(
      title: "Roof Joke",
      description: "I told a joke about a roof once… it went over everyone’s head.",
    ),
  ];
}
