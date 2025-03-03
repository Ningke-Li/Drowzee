:- include('database.pl').
meuse_argonne_offensive(Start,End) :- begin('meuse_argonne_offensive',_,_,Start), end('meuse_argonne_offensive',_,_,End), Start=<End.

next_meuse_argonne_offensive(Start,End) :- meuse_argonne_offensive(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_meuse_argonne_offensive_at_1917(Res) :- setof((Start,End),next_meuse_argonne_offensive(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_meuse_argonne_offensive_at_1917'), (next_meuse_argonne_offensive_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

