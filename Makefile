DESTDIR ?=
DATADIR ?= /usr/share
UNITDIR ?= /etc/systemd/system

SELINUX_TARGET := faketpm
SELINUX_MODULE := ${SELINUX_TARGET:=.pp.bz2}

all: $(SELINUX_MODULE)

%.pp.bz2: %.pp
	@echo Compressing $^ -\ $@
	bzip2 -9 -f $^

%.pp: %.te
	make -f $(DATADIR)/selinux/devel/Makefile $@

clean:
	rm -f $(SELINUX_TARGET).{fc,if,tc,pp,pp.bz2}
	rm -rf tmp/
	rm -f faketpm-*.{spec,tar.gz,noarch.rpm,src.rpm}
	rm -rf noarch/ SRPMS/

install:
	install -Dpm0644 -t $(DESTDIR)$(UNITDIR) faketpm.service
	install -Dpm0644 -t $(DESTDIR)$(DATADIR)/selinux/devel/include/contrib $(SELINUX_TARGET).if
	install -Dpm0644 -t $(DESTDIR)$(DATADIR)/selinux/packages $(SELINUX_MODULE)

.PHONY: install
