:- include('database.pl').
russo_persian_war(Start,End) :- begin('russo_persian_war',_,_,Start), end('russo_persian_war',_,_,End), Start=<End.

globally_russo_persian_war_during_5_9(Start,End) :- russo_persian_war(Start1,End1), Start is (Start1-5), End is (End1-9), Start=<End.

next_globally_russo_persian_war_during_5_9(Start,End) :- globally_russo_persian_war_during_5_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_russo_persian_war_during_5_9_at_1659(Res) :- setof((Start,End),next_globally_russo_persian_war_during_5_9(Start,End),AllINtervals), checkvalidity(1659,AllINtervals,Res).

check_query() :- write('Query = next_globally_russo_persian_war_during_5_9_at_1659'), (next_globally_russo_persian_war_during_5_9_at_1659(true) -> write('\nRes   = true');write('\nRes   = false')).

