#PLTW 3.1.3
# Simulate someone ordering at a fast ood restaurant
    #global variables should be defined within the first couple lines
total=0
orderInformation=""
orders=0
ketchup=0
    #sandwich
    #ask the user if they would like a chicken, beef, or tofu
order=[]
while input!="checkout":
    orders=input("What would you like to order; (sandwich, drink, fries, ketchup, checkout) ")
    if orders==("sandwich"):
        sandwich=input("Which sandwich would you like: chicken $5.25, beef $6.25, tofu $5.75 (c,b,t) ")
        if sandwich=="c":
                order.append("chicken sandwich")
                total+=5.25         # += -> total = total + 5.75
        elif sandwich=="b":
                order.append("beef sandwich")
                total+=6.25
        elif sandwich=="t":
                order.append("tofu sandwich")
                total+=5.75
        elif sandwich==("n"):
            order.append("no sandwich")

        orderInformation+=f"Sandwich:\t{sandwich}\n"
    #\t = tab
    #\n = new line also known as pressing enter

        #drinks
    if orders==("drink"):
        drink=input("Which size? s,m,l? ")
        if drink =="s":
            order.append("small drink")
            total+=1
        elif drink=="m":
            order.append("medium drink")
            total+=1.75
        elif drink=="l":
            drink=input("Would you like a child size for $.38 more? (y,n) ")
            if drink == "y":
                total+=(2.25+.38)
                drink ="c"
                order.append("child drink")
            else:
                total+= 2.25
                drink = "L"
                order.append("large drink")
        elif drink=="n":
            order.append("no drink")
        orderInformation+=f"Drink:\t{drink}\n"
        #fries
    if orders==("fries"):
        fries=input("Which size? s,m,l? ")
        if fries =="s":
            fries=input("Would you like to mega size the fries (y/n) ")
            if fries=="y":
                total+=2.00
                fries="L"
                order.append("mega fries")
            elif fries=="n":
                total+=1.00
                order.append("small fries")
        elif fries=="m":
            total+=1.50
            order.append("medium fries")
        elif fries=="l":
            total+=2.00
            order.append("large fries")
        elif fries=="n":
            order.append("no fries")

        orderInformation+=f"Fries:\t{fries}\n"
        #ketchup
    if orders==("ketchup"):
        ketchup=(int(input("How many? ")))
        ketchup*=0.25
        #checkout
    # if sandwich!="" and drink!="" and fries!="":
    #     total-=1    
    if orders==("checkout"):
        print(orderInformation)
        print("Total before taxes=",+ total)
        tax=(total*.07)
        print("Overall total",+ round(total+tax+ketchup,2))
        print(order)
        break
#hint hint wink wink:...... look up how to round... later...
