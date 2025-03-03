:- include('database.pl').
women_s_march_on_versailles(Start,End) :- begin('women_s_march_on_versailles',_,_,Start), end('women_s_march_on_versailles',_,_,End), Start=<End.

next_women_s_march_on_versailles(Start,End) :- women_s_march_on_versailles(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_women_s_march_on_versailles_at_1827(Res) :- setof((Start,End),next_women_s_march_on_versailles(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = next_women_s_march_on_versailles_at_1827'), (next_women_s_march_on_versailles_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).

