:- include('database.pl').
denazification(Start,End) :- begin('denazification',_,_,Start), end('denazification',_,_,End), Start=<End.

next_denazification(Start,End) :- denazification(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_denazification_at_1822(Res) :- setof((Start,End),next_denazification(Start,End),AllINtervals), checkvalidity(1822,AllINtervals,Res).

check_query() :- write('Query = next_denazification_at_1822'), (next_denazification_at_1822(true) -> write('\nRes   = true');write('\nRes   = false')).

