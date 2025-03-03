:- include('database.pl').
bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

globally_bojack_horseman_during_2_6(Start,End) :- bojack_horseman(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

next_globally_bojack_horseman_during_2_6(Start,End) :- globally_bojack_horseman_during_2_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_bojack_horseman_during_2_6_at_2043(Res) :- setof((Start,End),next_globally_bojack_horseman_during_2_6(Start,End),AllINtervals), checkvalidity(2043,AllINtervals,Res).

check_query() :- write('Query = next_globally_bojack_horseman_during_2_6_at_2043'), (next_globally_bojack_horseman_during_2_6_at_2043(true) -> write('\nRes   = true');write('\nRes   = false')).

