:- include('database.pl').
juncker_commission(Start,End) :- begin('juncker_commission',_,_,Start), end('juncker_commission',_,_,End), Start=<End.

globally_juncker_commission_during_4_5(Start,End) :- juncker_commission(Start1,End1), Start is (Start1-4), End is (End1-5), Start=<End.

next_globally_juncker_commission_during_4_5(Start,End) :- globally_juncker_commission_during_4_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_juncker_commission_during_4_5_at_2011(Res) :- setof((Start,End),next_globally_juncker_commission_during_4_5(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_globally_juncker_commission_during_4_5_at_2011'), (next_globally_juncker_commission_during_4_5_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

