NAME=plort
OS?=osx
include Makefile.$(OS) 


#.SILENT:

all: clean build run

clean:
	$(RM) $(NAME).love

test:
	tsc spec/*spec.lua

test_verbose:
	tsc -f spec/*spec.lua

integration:
	cp love/conf.lua.base love/conf.lua
	echo TEST=true >> love/conf.lua
	cd love && $(ZIP) ../$(NAME).zip .
	mv $(NAME).zip $(NAME).love
	$(LOVE) $(NAME).love	

build: clean
	cp love/conf.lua.base love/conf.lua
	cd love && $(ZIP) ../$(NAME).zip .
	mv $(NAME).zip $(NAME).love

run: build
	$(LOVE) $(NAME).love	

publish: build
	scp $(NAME).love mindfill.com:www/projects/games/plort
