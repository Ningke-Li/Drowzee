:- include('database.pl').
bosnian_crisis(Start,End) :- begin('bosnian_crisis',_,_,Start), end('bosnian_crisis',_,_,End), Start=<End.

next_bosnian_crisis(Start,End) :- bosnian_crisis(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_bosnian_crisis_at_1837(Res) :- setof((Start,End),next_bosnian_crisis(Start,End),AllINtervals), checkvalidity(1837,AllINtervals,Res).

check_query() :- write('Query = next_bosnian_crisis_at_1837'), (next_bosnian_crisis_at_1837(true) -> write('\nRes   = true');write('\nRes   = false')).

