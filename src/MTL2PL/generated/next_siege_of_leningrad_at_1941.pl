:- include('database.pl').
siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

next_siege_of_leningrad(Start,End) :- siege_of_leningrad(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_siege_of_leningrad_at_1941(Res) :- setof((Start,End),next_siege_of_leningrad(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = next_siege_of_leningrad_at_1941'), (next_siege_of_leningrad_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

