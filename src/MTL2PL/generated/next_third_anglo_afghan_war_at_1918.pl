:- include('database.pl').
third_anglo_afghan_war(Start,End) :- begin('third_anglo_afghan_war',_,_,Start), end('third_anglo_afghan_war',_,_,End), Start=<End.

next_third_anglo_afghan_war(Start,End) :- third_anglo_afghan_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_third_anglo_afghan_war_at_1918(Res) :- setof((Start,End),next_third_anglo_afghan_war(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = next_third_anglo_afghan_war_at_1918'), (next_third_anglo_afghan_war_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

