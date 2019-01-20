1. how can I make interchangeable arguments of Order initialize?
2. with new function make sure that Order initialize arguments are the correct type of element
3. do I need to have a SummaryOrder class? Maybe is just a method on LiveOrderBoard.
4. should I need to specified that #remove_order on LiveOrderBoard
class will only receive user_id, otherwise it is going to send an error message.
5. refactor live_order_board_spec.rb
6. idear modo en que new_order no retorne simepre order_data, para en 'remove order from list when the its user_id is equal to the given user_id' probar con otro user_id si funciona. e.g.: poner arguments en: string, integer...etc
7. hacer README
8. que metodos debieran ser privados? #add_to_order_list?
9. pensar en sigle responsability. live_order_board esta haceidno demasiado?
