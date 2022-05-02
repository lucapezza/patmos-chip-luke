make install

sed -i '/\-u/d' caravel/openlane/Makefile
sed -i 's/-u $$(id -u $$USER):$$(id -g $$USER)//' Makefile
sed -i 's/-u $(shell id -u $(USER)):$(shell id -g $(USER)) //' Makefile
sed -i 's/-u $(shell id -u $(USER)):$(shell id -g $(USER))//' caravel/Makefile

make check-env install_mcw simenv