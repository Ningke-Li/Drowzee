:- include('database.pl').
six_feet_under(Start,End) :- begin('six_feet_under',_,_,Start), end('six_feet_under',_,_,End), Start=<End.

next_six_feet_under(Start,End) :- six_feet_under(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_six_feet_under_at_1858(Res) :- setof((Start,End),next_six_feet_under(Start,End),AllINtervals), checkvalidity(1858,AllINtervals,Res).

check_query() :- write('Query = next_six_feet_under_at_1858'), (next_six_feet_under_at_1858(true) -> write('\nRes   = true');write('\nRes   = false')).

