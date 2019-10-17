class Game
  attr_accessor :current_player, :status, :board, :array_player

  def initialize
    welcome_infos
    take_infos_players
    lead_game
  end

  def welcome_infos
    puts "BONJOUR, ET BIENVENUE SUR CE SUPER MORPION"
    puts "\n\nVoici les règles du jeu :\n"
    puts "
1 - Le jeu ne se joue qu'à deux joueurs humains (on ne vous demande pas de coder d'intelligence artificielle aujourd'hui…);
2 - Le programme doit commencer en demandant le prénom de chaque joueur ;
3 - Le plateau de jeu est composé de 9 cases, chacune désignée par sa position verticale (A, B ou C) suivie de sa position horizontale (1, 2 ou 3). Exemples : la case en haut à droite s'appelle 'A3' et celle en bas à droite 'C3' ;
4 - Au début de chaque tour de jeu, le programme affiche dans le terminal le plateau de jeu. Puis il demande au joueur dont c'est le tour où il souhaite jouer ;
5 - Les joueurs jouent à tour de rôle jusqu'à que l'un d'eux gagne ou que le plateau de jeu soit rempli ;\n\n\n"
  end

  def lead_game
    puts "\n\nEt c'est parti !\n\n"
    @board = Board.new
    @current_player = @player1
    turn
    end_game
    new_game? == true ? lead_game : 0
  end

  def take_infos_players
    puts "\nJoueurs 1, quel est ton prénom ?"
    print "> "
    joueur1_name = gets.chomp
    puts "Bonjour #{joueur1_name} préfères-tu les x ou les o ?"
    joueur1_choice = "z"
    while joueur1_choice != "x" && joueur1_choice != "o"
      print "> "
      joueur1_choice = gets.chomp
      if joueur1_choice != "x" && joueur1_choice != "o"
        puts "\nNop, je t'ai dis 'x' ou 'o'\n"
      end
    end
    puts "\nEt toi joueurs 2, quel est ton prénom ?"
    print "> "
    joueur2_name = gets.chomp
    joueur2_choice = joueur1_choice == "x" ? joueur2_choice = "o" : joueur2_choice = "x"
    puts "Bonjour #{joueur2_name}, tu auras donc les #{joueur2_choice}"
    @player1 = Player.new(joueur1_name, joueur1_choice)
    @player2 = Player.new(joueur2_name, joueur2_choice)
  end

  def turn
    while @board.end_by_victory? == false && @board.end_by_equality? == false
      @board.screen
      @board.play_turn(@current_player)
      @current_player = @player1 == @current_player ? @player2 : @player1
    end
  end

  def end_game
    @board.screen
    @current_player = @player1 == @current_player ? @player2 : @player1
    if @board.end_by_victory? == true
      puts "Bravo #{@current_player.player_name}, tu as gagné"
    elsif @board.end_by_equality? == true
      puts "Personne n'a gagné"
    end
  end

  def new_game?
    puts "\n\nUne nouvelle partie ? 'q' pour quitter"
    print "\n> "
    new_choice = gets.chomp
    if new_choice != "q"
      puts "\nMême joueurs ? 'n' pour non"
      print "> "
      other_player = gets.chomp
      if other_player == "n"
        Game.new
      end
    end
    return new_choice == "q" ? false : true
  end
end
