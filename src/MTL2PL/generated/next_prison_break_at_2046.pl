:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

next_prison_break(Start,End) :- prison_break(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_prison_break_at_2046(Res) :- setof((Start,End),next_prison_break(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = next_prison_break_at_2046'), (next_prison_break_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).

