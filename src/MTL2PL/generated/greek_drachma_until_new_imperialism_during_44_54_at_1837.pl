:- include('database.pl').
greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

greek_drachma_last_till_44_54(Start,End) :- greek_drachma(Start1,End1), (End1-Start1)>=44, Start is (Start1+44), End is (End1+1).

greek_drachma_until_new_imperialism_during_44_54_overlap(Start,End) :- greek_drachma_last_till_44_54(Start1,End1), new_imperialism(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

greek_drachma_until_new_imperialism_during_44_54(Start,End) :- greek_drachma(W1,_), greek_drachma_until_new_imperialism_during_44_54_overlap(Start1,End1), Start is max((Start1-54),W1), End is (End1-44), Start=<End.

greek_drachma_until_new_imperialism_during_44_54_at_1837(Res) :- setof((Start,End),greek_drachma_until_new_imperialism_during_44_54(Start,End),AllINtervals), checkvalidity(1837,AllINtervals,Res).

check_query() :- write('Query = greek_drachma_until_new_imperialism_during_44_54_at_1837'), (greek_drachma_until_new_imperialism_during_44_54_at_1837(true) -> write('\nRes   = true');write('\nRes   = false')).

