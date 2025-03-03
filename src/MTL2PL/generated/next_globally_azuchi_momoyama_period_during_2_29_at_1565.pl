:- include('database.pl').
azuchi_momoyama_period(Start,End) :- begin('azuchi_momoyama_period',_,_,Start), end('azuchi_momoyama_period',_,_,End), Start=<End.

globally_azuchi_momoyama_period_during_2_29(Start,End) :- azuchi_momoyama_period(Start1,End1), Start is (Start1-2), End is (End1-29), Start=<End.

next_globally_azuchi_momoyama_period_during_2_29(Start,End) :- globally_azuchi_momoyama_period_during_2_29(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_azuchi_momoyama_period_during_2_29_at_1565(Res) :- setof((Start,End),next_globally_azuchi_momoyama_period_during_2_29(Start,End),AllINtervals), checkvalidity(1565,AllINtervals,Res).

check_query() :- write('Query = next_globally_azuchi_momoyama_period_during_2_29_at_1565'), (next_globally_azuchi_momoyama_period_during_2_29_at_1565(true) -> write('\nRes   = true');write('\nRes   = false')).

