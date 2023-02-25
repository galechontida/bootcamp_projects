#welcome
print("Hi! Welcome to CH-KAMMLER's Pizza, and thanks for visiting :)")
print("What is your name?")
customer_name <- readLines("stdin",n=1)
print(paste("Hi",customer_name,"!"))                

#pizza
#size
testSizeOfPizza <- function(size){
   if (size == 1 || size == 2 || size == 3)
   {return (TRUE)} else {return (FALSE)}} 
validsection <- FALSE
while(!validsection)
{
print("What pizza do you want?")
print("1.Hawaiian 2.Chesse & Bacon 3.Seafood 4.Classic Mushroom & Tomato")
  pizza <- readLines("stdin",n=1)
if (pizza ==1) {
  validsection <- TRUE
  print("You ordered Hawaiian.")
  s <- FALSE
  while(!s) {
  print("Which size do you want? 1.S 2.M 3.L")
  size <- readLines("stdin",n=1)
  if (testSizeOfPizza(size)) {
  s <- TRUE
  price <- c(360,380,400)
  pizza_price <- price[as.numeric(size)]}
  else { print("Please enter number BETWEEN 1-3") }}
} else if (pizza == 2) {
  validsection <- TRUE
  print("You ordered Chesse & Bacon.")
  s <- FALSE
  while(!s) {
  print("Which size do you want? 1.S 2.M 3.L")
  size <- readLines("stdin",n=1)
  if (testSizeOfPizza(size)) {
  s <- TRUE
  price <- c(360,380,400)
  pizza_price <- price[as.numeric(size)]}
  else { print("Please enter number BETWEEN 1-3") }}
} else if (pizza == 3) {
  validsection <- TRUE
  print("You ordered Seafood.")
  s <- FALSE
  while(!s) {
  print("Which size do you want? 1.S 2.M 3.L")
  size <- readLines("stdin",n=1)
  if (testSizeOfPizza(size)) {
  s <- TRUE
  price <- c(420,450,500)
  pizza_price <- price[as.numeric(size)]}
  else { print("Please enter number BETWEEN 1-3") }}
} else if (pizza == 4) {
  validsection <- TRUE
  print("You ordered Classic Mushroom & Tomato.")
  s <- FALSE
  while(!s) {
  print("Which size do you want? 1.S 2.M 3.L")
  size <- readLines("stdin",n=1)
  if (testSizeOfPizza(size)) {
  s <- TRUE
  price <- c(370,390,420)
  pizza_price <- price[as.numeric(size)]}
  else { print("Please enter number BETWEEN 1-3") }}
} else {
  print("Please select number BETWEEN 1-4!!")
}
}
#how many pizza
a <- FALSE
while(!a) {
print("How many pizza do you want?")
item <- readLines("stdin",n=1)
if (!grepl("[^[:digit:]\\.-]",item)) {
  item <- as.numeric(item)
  a <- TRUE
  pizza_price <- pizza_price * item}
  else { print("Please enter only number") }}

#Appetizers
validsection <- FALSE
while(!validsection)
{
print("Do you want appetizers? (yes / no)")
  appetizer <- tolower(readLines("stdin",n=1))
if (appetizer == "yes") {
  validsection <- TRUE
  app <- FALSE
  while(!app){
  print ("What do you want? We have 1.Garlic bread 2.Fish Fingers 3.Cheese sticks 4.Calamari")
  a <- readLines("stdin",n=1)
  
    if (!grepl("[^[:digit:]\\.-]",a)){
      a <- as.numeric(a)
      if (a == 1 || a== 2 || a == 3 || a == 4){
        price <- c(100,120,180,80) 
        appetizer_price <- price[a]
        app <-TRUE
      }
      else {(print("Please input number between 1-4!"))}
    }
    else {(print("Please input number between 1-4!"))}
}} else if (appetizer == "no") {
  validsection <- TRUE
  appetizer_price <- 0  
} else {
  print ("Pleae type yes OR no")
}}
if (appetizer == "yes")
{
b <- FALSE
while(!b) {
print("How many item do you want?")
item2 <- readLines("stdin",n=1)
if (!grepl("[^[:digit:]\\.-]",item2)) {
  item2 <- as.numeric(item2)
  b <- TRUE
  appetizer_price <- appetizer_price * item2} 
  else { print("Please enter only number") }}
}
#Drinks&Desserts
validsection <- FALSE
while(!validsection)
{
print("Do you want Drinks & Desserts? (yes / no)")
  drink <- tolower(readLines("stdin",n=1))
if (drink == "yes") {
  validsection <- TRUE
  dk <- FALSE
  while(!dk){
  print ("What do you want? We have 1.Coke 2.Sprite 3.Egg tart 4.Chocolate Ice Cream")
  b <- readLines("stdin",n=1)
    if (!grepl("[^[:digit:]\\.-]",b)){
      b <- as.numeric(b)
      if (b == 1 || b== 2 || b == 3 || b == 4){
        price <- c(20,20,120,150) 
        drink_price <- price[b]
        dk <-TRUE
      }
      else {(print("Please input number between 1-4!"))}
    }
    else {(print("Please input number between 1-4!"))}
}} else if (drink == "no") {
  validsection <- TRUE
  drink_price <- 0
} else {
  print ("Pleae type yes OR no")
}}
if (drink == "yes")
{
c <- FALSE
while(!c) {
print("How many item do you want?")
item3 <- readLines("stdin",n=1)
if (!grepl("[^[:digit:]\\.-]",item3)) {
  item3 <- as.numeric(item3)
  c <- TRUE
  drink_price <- drink_price * item3} 
  else { print("Please enter only number") }}}

#confirm order
validsection <- FALSE
while(!validsection)
{
print(paste("Hey",customer_name,",","Please type 1.Confirm an order 2.Cancel an order "))
  confirm <- tolower(readLines("stdin",n=1))
if (confirm == 1) {
  validsection <- TRUE
  print ("How do you want to pay?")
  paymentID <- c(1,2,3,4)
  payments <- c("cash","credit","gift card","paypal") 
  x <- data.frame(paymentID,payments)
  print (x)
    payments_method <- as.numeric(readLines("stdin",n=1))
    p <- FALSE
    while(!p)
    {print ("what's your phone number?")
      phone_num <- readLines("stdin",n=1)
      if ((!grepl("[^[:digit:]\\.-]",phone_num))) {
        as.numeric(phone_num) -> phone_num
      if (is.numeric(phone_num) == TRUE & nchar(phone_num) + 1 == 10){p <- TRUE
    } else { print ("Phone number should be 10 digits!!! (0**-***-****)")}}
     else {print ("Phone number should be 10 digits!!! (0**-***-****)")}}
    print ("What's your address?")
    ad <- readLines("stdin",n=1)
    isLeaving <- FALSE
} else if (confirm == 2) {
  validsection <- TRUE
  print("We’re sorry to see you leave.")
  isLeaving <- TRUE
} else {
  print ("Pleae type 1 OR 2")
}}

if (!isLeaving){
#summary
price <- pizza_price
print("---Summary order---")
print(paste("Customer's name: ",customer_name))
print(paste("Customer's number: ",formatC(phone_num, width = 10, format = "d", flag = "0")))
print(paste("Customer's address: ", ad))
print(paste("Total:", pizza_price + appetizer_price + drink_price ,"฿"))
print(paste("Payment method: ",payments[payments_method]))
print("---Have a nice day :D---")
print("---Ich wünsche Ihnen einen schönen Tag!---")
print("---tack!---")
}
