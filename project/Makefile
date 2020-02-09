%.lex.sml : %.lex
	mllex $<

%.grm.sml : %.grm
	mlyacc $<

PHONY : all clean test

all : parsing

parsing: ast.sml tiger.sml tiger.mlb tiger.grm.sml tiger.lex.sml indent.sml
	mlton -output parsing tiger.mlb

clean :
	rm -f parsing
	rm -f tiger.lex.sml

test: parsing
	$(CURDIR)/parsing test.txt
