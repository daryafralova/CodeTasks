#Complete the function, which calculates how much you need to tip based on the total amount of the bill and the service.
#You need to consider the following ratings:
#Terrible: tip 0%
#Poor: tip 5%
#Good: tip 10%
#Great: tip 15%
#Excellent: tip 20%

def calculate_tip(amount, rating):
    rating = rating.lower()
    if rating == "terrible":
        tip_percentage = 0
    elif rating == "poor":
        tip_percentage = 0.05
    elif rating == "good":
        tip_percentage = 0.10
    elif rating == "great":
        tip_percentage = 0.15
    elif rating == "excellent":
        tip_percentage = 0.20
    else:
        return "Rating not recognised"  

    tip_amount = amount * tip_percentage
    rounded_tip = int(tip_amount) + (tip_amount % 1 > 0)
    return rounded_tip
