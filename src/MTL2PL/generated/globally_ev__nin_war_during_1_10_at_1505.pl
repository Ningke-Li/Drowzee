:- include('database.pl').
ev__nin_war(Start,End) :- begin('ev__nin_war',_,_,Start), end('ev__nin_war',_,_,End), Start=<End.

globally_ev__nin_war_during_1_10(Start,End) :- ev__nin_war(Start1,End1), Start is (Start1-1), End is (End1-10), Start=<End.

globally_ev__nin_war_during_1_10_at_1505(Res) :- setof((Start,End),globally_ev__nin_war_during_1_10(Start,End),AllINtervals), checkvalidity(1505,AllINtervals,Res).

check_query() :- write('Query = globally_ev__nin_war_during_1_10_at_1505'), (globally_ev__nin_war_during_1_10_at_1505(true) -> write('\nRes   = true');write('\nRes   = false')).

