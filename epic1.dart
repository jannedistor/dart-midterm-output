import 'dart:io';
import 'dart:math';

enum Move { papel, gunting, bato }
void main(){
    
    int cpuScore= 0;
    int playerScore = 0;
     
     //asks the user how many rounds he/she wants
     print("Enter number of rounds:");
   int number_of_rounds = int.parse(stdin.readLineSync());
     
    //loop for each round
    for (var i = 1; i <= number_of_rounds; i++)
   {
    stdout.write("Round $i : Papel, Gunting, Bato! What's your Pick? type 'quit' to exit the game. ");
    String input = stdin.readLineSync().toLowerCase();
    
    //player move (pro)
    if (input == 'papel' || input == 'gunting' || input == 'bato') {
      var playerMove;
      if (input == 'papel') {
        playerMove = Move.papel;
      } else if (input == 'gunting') {
        playerMove = Move.gunting;
      } else {
        playerMove = Move.bato;
      }
      
      //computer move(very random)
      final random = Random().nextInt(3);
      final computerMove = Move.values[random];
      
      //displays moves of player and computer
      print('You️ : $input');
      print('Computer ️: $computerMove');
      
      //game conditions
      if (playerMove == computerMove) {
       print("It's a tie.");
      } else if (playerMove == Move.papel && computerMove == Move.bato || playerMove == Move.gunting && computerMove == Move.papel || playerMove == Move.bato && computerMove == Move.gunting) {
        print("You win!");
        playerScore++;
      } else {
       print("You lose!");
        cpuScore++;
      }
    }//quits the game
    else if (input == 'quit') {
      break;
    } else { 
      print('Invalid input'); //error state
    }
   
  }
   //analyzes scores (+1 for each round won)
        if(playerScore >cpuScore){ //human wins
            print("You win 🏆 ! Bot 🙆‍: $cpuScore, You 🙋‍: $playerScore");
        }else if (playerScore < cpuScore){ //bot wins
            print("Haha! Bot wins! What a loser 😥 . Bot 🙆‍: $cpuScore, You 🙋‍ : $playerScore");
        }else{
            print("It's a tie ⚖!");//equality
        }
  
     }
     
