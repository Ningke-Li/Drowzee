:- include('database.pl').
european_migrant_crisis(Start,End) :- begin('european_migrant_crisis',_,_,Start), end('european_migrant_crisis',_,_,End), Start=<End.

globally_european_migrant_crisis_during_1_2(Start,End) :- european_migrant_crisis(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_european_migrant_crisis_during_1_2_at_2013(Res) :- setof((Start,End),globally_european_migrant_crisis_during_1_2(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = globally_european_migrant_crisis_during_1_2_at_2013'), (globally_european_migrant_crisis_during_1_2_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

