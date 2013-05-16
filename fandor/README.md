Fandor Interview
================

My solution to this problem models the Building, Floors, and Elevator as
independent objects.  The Floor has a method for calling the elevator
that represents pushing the button to call the elevator.  The Elevator
has a move method to model pushing a floor number.  The move method will
return the new Floor once it is reached.

Because this task was a simple one, I did not put in a few key elements
that would be needed for real solution.  I assumed the user had perfect
knowledge of the building and would only input a valid floor number.  I
also assumed that the a user would complete calling the elevator and
moving atomically.  That is, a user would call the elevator and move
before another user would call the elevator.  In order to implement
multiple users, the elevator would have to implement transient states as
it moves to the destination floor and would behave differently based on
the directionality of the elevator movement and relative location of the
user.
