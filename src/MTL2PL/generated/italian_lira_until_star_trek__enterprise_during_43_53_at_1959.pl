:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

star_trek__enterprise(Start,End) :- begin('star_trek__enterprise',_,_,Start), end('star_trek__enterprise',_,_,End), Start=<End.

italian_lira_last_till_43_53(Start,End) :- italian_lira(Start1,End1), (End1-Start1)>=43, Start is (Start1+43), End is (End1+1).

italian_lira_until_star_trek__enterprise_during_43_53_overlap(Start,End) :- italian_lira_last_till_43_53(Start1,End1), star_trek__enterprise(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

italian_lira_until_star_trek__enterprise_during_43_53(Start,End) :- italian_lira(W1,_), italian_lira_until_star_trek__enterprise_during_43_53_overlap(Start1,End1), Start is max((Start1-53),W1), End is (End1-43), Start=<End.

italian_lira_until_star_trek__enterprise_during_43_53_at_1959(Res) :- setof((Start,End),italian_lira_until_star_trek__enterprise_during_43_53(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = italian_lira_until_star_trek__enterprise_during_43_53_at_1959'), (italian_lira_until_star_trek__enterprise_during_43_53_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

