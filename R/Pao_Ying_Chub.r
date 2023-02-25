#welcome
print("=====================")
print("Welcome to")
print("Rock Paper Scissors")
print("=====================")
#game
count <- 0
win <- 0
draw <- 0
lose <- 0

while(TRUE){
print("Type 'R' for Rock")
print("Type 'P' for Paper")
print("Type 'S for Scissors")
print("Type 'Q' for Quit")
print("Please select:")
  user <- toupper(readLines("stdin",n=1))
bot <- c("R","P","S")
random <- sample(bot,size=1)
if (user == "R" & random == "S" || user == "P" & random == "R" || user == "S" & random == "P") {
    print(paste("You chose:",user))
    print(paste("Bot chose:",random))
    print("YOU WIN")
    count <- count + 1
    win <- win + 1
  } else if (user == "R" & random == "P" || user == "P" & random == "S" || user == "S" & random == "R"){
    print(paste("You chose:",user))
    print(paste("Bot chose:",random))
    print("YOU LOSE")
    count <- count + 1
    lose <- lose + 1
  } else if (user == "R" & random == "R" || user == "P" & random == "P" || user == "S" & random == "S") {
    print(paste("You chose:",user))
    print(paste("Bot chose:",random))
    print("DRAW")
    count <- count + 1
    draw <- draw + 1
  } else if (user== "Q") {
    print("QUIT")
    break
  } else {
  print("Please type 'R','P','S', or'Q'")
  }
}
#summary
print("-SUMMARY-")
print(paste("Total:",count))
print(paste("win:",win))
print(paste("draw:",draw))
print(paste("lose:",lose))