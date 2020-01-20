EXEC=eufemd

all:
	chmod 755 debian/DEBIAN/postinst
	dpkg-deb --build debian
	mv debian.deb $(EXEC).deb

install: $(EXEC).deb
	sudo dpkg -i $(EXEC).deb


clean:
	rm $(EXEC).deb

uninstall:
	sudo dpkg -r $(EXEC)

