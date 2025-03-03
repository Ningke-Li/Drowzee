:- include('database.pl').
bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

globally_bojack_horseman_during_3_4(Start,End) :- bojack_horseman(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

next_globally_bojack_horseman_during_3_4(Start,End) :- globally_bojack_horseman_during_3_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_bojack_horseman_during_3_4_at_2013(Res) :- setof((Start,End),next_globally_bojack_horseman_during_3_4(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = next_globally_bojack_horseman_during_3_4_at_2013'), (next_globally_bojack_horseman_during_3_4_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

