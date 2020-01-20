%.lex.sml : %.lex
	mllex $<

PHONY : all clean test

all : tigh

tigh: tokens.sml tiger.lex.sml tiger.mlb tigh.sml
	mlton -output tigh tiger.mlb

clean :
	rm -f tigh
	rm -f tiger.lex.sml

test:
	$(CURDIR)/tigh test.txt
