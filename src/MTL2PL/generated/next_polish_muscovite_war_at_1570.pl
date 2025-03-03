:- include('database.pl').
polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

next_polish_muscovite_war(Start,End) :- polish_muscovite_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_polish_muscovite_war_at_1570(Res) :- setof((Start,End),next_polish_muscovite_war(Start,End),AllINtervals), checkvalidity(1570,AllINtervals,Res).

check_query() :- write('Query = next_polish_muscovite_war_at_1570'), (next_polish_muscovite_war_at_1570(true) -> write('\nRes   = true');write('\nRes   = false')).

