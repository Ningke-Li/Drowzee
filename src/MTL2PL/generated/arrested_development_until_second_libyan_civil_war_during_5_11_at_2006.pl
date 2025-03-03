:- include('database.pl').
arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

arrested_development_last_till_5_11(Start,End) :- arrested_development(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

arrested_development_until_second_libyan_civil_war_during_5_11_overlap(Start,End) :- arrested_development_last_till_5_11(Start1,End1), second_libyan_civil_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

arrested_development_until_second_libyan_civil_war_during_5_11(Start,End) :- arrested_development(W1,_), arrested_development_until_second_libyan_civil_war_during_5_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-5), Start=<End.

arrested_development_until_second_libyan_civil_war_during_5_11_at_2006(Res) :- setof((Start,End),arrested_development_until_second_libyan_civil_war_during_5_11(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = arrested_development_until_second_libyan_civil_war_during_5_11_at_2006'), (arrested_development_until_second_libyan_civil_war_during_5_11_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

