:- include('database.pl').
austrian_civil_war(Start,End) :- begin('austrian_civil_war',_,_,Start), end('austrian_civil_war',_,_,End), Start=<End.

next_austrian_civil_war(Start,End) :- austrian_civil_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_austrian_civil_war_at_1787(Res) :- setof((Start,End),next_austrian_civil_war(Start,End),AllINtervals), checkvalidity(1787,AllINtervals,Res).

check_query() :- write('Query = next_austrian_civil_war_at_1787'), (next_austrian_civil_war_at_1787(true) -> write('\nRes   = true');write('\nRes   = false')).

