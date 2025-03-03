:- include('database.pl').
renaissance(Start,End) :- begin('renaissance',_,_,Start), end('renaissance',_,_,End), Start=<End.

thirty_years__war(Start,End) :- begin('thirty_years__war',_,_,Start), end('thirty_years__war',_,_,End), Start=<End.

renaissance_last_till_51_59(Start,End) :- renaissance(Start1,End1), (End1-Start1)>=51, Start is (Start1+51), End is (End1+1).

renaissance_until_thirty_years__war_during_51_59_overlap(Start,End) :- renaissance_last_till_51_59(Start1,End1), thirty_years__war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

renaissance_until_thirty_years__war_during_51_59(Start,End) :- renaissance(W1,_), renaissance_until_thirty_years__war_during_51_59_overlap(Start1,End1), Start is max((Start1-59),W1), End is (End1-51), Start=<End.

renaissance_until_thirty_years__war_during_51_59_at_1623(Res) :- setof((Start,End),renaissance_until_thirty_years__war_during_51_59(Start,End),AllINtervals), checkvalidity(1623,AllINtervals,Res).

check_query() :- write('Query = renaissance_until_thirty_years__war_during_51_59_at_1623'), (renaissance_until_thirty_years__war_during_51_59_at_1623(true) -> write('\nRes   = true');write('\nRes   = false')).

