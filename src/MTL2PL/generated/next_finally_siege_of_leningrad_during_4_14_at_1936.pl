:- include('database.pl').
siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

finally_siege_of_leningrad_during_4_14(Start,End) :- siege_of_leningrad(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

next_finally_siege_of_leningrad_during_4_14(Start,End) :- finally_siege_of_leningrad_during_4_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_siege_of_leningrad_during_4_14_at_1936(Res) :- setof((Start,End),next_finally_siege_of_leningrad_during_4_14(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = next_finally_siege_of_leningrad_during_4_14_at_1936'), (next_finally_siege_of_leningrad_during_4_14_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

