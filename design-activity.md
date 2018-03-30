

1) What classes does each implementation include? Are the lists the same?
Write down a sentence to describe each class.

Both implementations use the same class names but implement them a bit differently. The classes are CartEntry, ShoppingCart, and Order.

CartEntry holds a single item's price and quantity, ShoppingCart holds all the individual entries from the CartEntry in a list, and the Order class gives an overall cost.



2) How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

The ShoppingCart class holds a list (array) of multiple CartEntries (which are grocery food items with their price and how many are being bought) and the Order class takes that info from the ShoppingCart it creates and gets an overall total price.



3) What data does each class store? How (if at all) does this differ between the two implementations?

implementation A only the Order class seems to hold the logic for pricing/cost.
For implementation A: CartEntry class holds data for unit_price and quantity (which are arguments given), ShoppingCart class holds entries, and Order class does the logic to create an instance of a Shopping Cart and get its total price.
For implementation B: CartEntry class gets data for unit price and quantity as well as the logic to get the price of them, ShoppingCart class still holds the entries but also gets a price of each entry, and the Order class still creates a new instance of ShoppingCart and a total_price (that includes sales tax).


4) What methods does each class have? How (if at all) does this differ between the two implementations?

They all have initialize methods but in A, only Order has another method within itself to get total price. In B, every class has a price method.



5) Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

In A, the logic is all in the Order class only whereas in B each lower level class has a way to compute it's level of price (first for each item, then for full order, them for total price with sales tax.)



6) Does total_price directly manipulate the instance variables of other classes?

Yes. In A, it manipulates instance variables in both of the other classes. In B, only works with the ShoppingCart instance.

7) If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

Yes, it would change the code. It will be easier to modify in B because we could change the price in CartEntry alone without having to modify the other classes' methods.

8) Which implementation better adheres to the single responsibility principle?

B!

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?

B! It doesn't need to know as much as A's Order class which needs to know both other classes and their methods.

---------------------------------------------------------------

Revisit Hotel:

Describe in design-activity.md what changes you would need to make to improve this design, and how the resulting design would be an improvement.

My Room class does not need to hold data for date ranges booked. That can be done in reception only. This will also help with coupling in Reception where I am adding reservations that relies on knowing that room's holds that info when it can just find it by searching the overall reservation list instead. Once I remove @booked_dates from Room class I'll need to make changes to Reception's add_reservation method and the check_availability method.
