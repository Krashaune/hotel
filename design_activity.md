What classes does each implementation include? Are the lists the same?
  Each implementation has the same classes CartEntry, ShoppingCart, and Order.

Write down a sentence to describe each class.
  CartEntry: the CartEntry is responsible for keeping track of the unit price and quantity of each cart item.
  ShoppingCart:The shopping car is responsible for storing all the entries in an array.
  Order: The order is responsible for storing the sales tax, creating a new shopping cart, and calculating the total price of each cart.

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
  Each class relies on another to either fill in its data or to use in a method to calculate data.

What data does each class store? How (if at all) does this differ between the two implementations?
  ShoppingCart is the only class that stores data it stores all the entries. this is the same among implementations

What methods does each class have? How (if at all) does this differ between the two
implementations?
  In implementation A Order is the only class that contains a method outside of initialize and it has a total_price method.

  In implementation B all of the classes have a method. CartEntry and ShoppingCart have a price method, which differ from each other  and order class has a total_price method.

Consider the Order#total_price method. In each implementation:

Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  It is delegated to lower level classes

Does total_price directly manipulate the instance variables of other classes?   
  yes.

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  The CartEntry class would change to include constants with bulk pricing. this could possibly be done with a method and if bulk pricing the equation of total price would differ. I think implementation A would be easier to modify because it refers to unit_price and quantity only once outside of the CartEntry class.

Which implementation better adheres to the single responsibility principle?
  Implementation A

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
  Implementation A


 Identify one place in your Hotel project where a class takes on multiple roles, or directly modifies the attributes of another class.
 Describe in design-activity.md what changes you would need to make to improve this design, and how the resulting design would be an improvement.
    The hotel class takes on multiple roles, it does not modify attributes from the reservation class but, along with storing the reservations and listing the reservations and rooms available it also determines whether a room is available which could be something that a room class could do. To improve this design I would add a room class which would take on storing the rooms and managing whether they were available or not. Then the hotel could call the method in the rooms class as it does in the reservations class to determine whether the room is available and add it to a reservation and/or list available rooms depending on what admin needed to do.
