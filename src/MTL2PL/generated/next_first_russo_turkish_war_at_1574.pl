:- include('database.pl').
first_russo_turkish_war(Start,End) :- begin('first_russo_turkish_war',_,_,Start), end('first_russo_turkish_war',_,_,End), Start=<End.

next_first_russo_turkish_war(Start,End) :- first_russo_turkish_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_russo_turkish_war_at_1574(Res) :- setof((Start,End),next_first_russo_turkish_war(Start,End),AllINtervals), checkvalidity(1574,AllINtervals,Res).

check_query() :- write('Query = next_first_russo_turkish_war_at_1574'), (next_first_russo_turkish_war_at_1574(true) -> write('\nRes   = true');write('\nRes   = false')).

