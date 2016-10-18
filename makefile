SOURCES = yxml.c
LIBRARY = libyxml.lib
PSX_CC = CCPSX.EXE
PSX_AR = PSYLIB.EXE
PSX_CFLAGS = -O3 -c
PSX_OBJECTS = $(SOURCES:.c=.obj)
PSX_LIBRARY_CREATE = echo 'D:\r cd "$(CURDIR:/%=%)/"\r $(PSX_AR) /a $(LIBRARY) $(PSX_OBJECTS)\r exitemu\r' | dosemu -dumb


all: PSX_BUILD
	
PSX_BUILD: $(PSX_OBJECTS)
	$(PSX_LIBRARY_CREATE)
	rm -f $(PSX_OBJECTS)
	
%.obj: %.c
	$(PSX_CC) $< $(PSX_CFLAGS) -o $@

clean:
	rm -f $(PSX_OBJECTS) $(LIBRARY)