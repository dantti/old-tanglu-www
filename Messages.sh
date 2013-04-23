#! /usr/bin/env bash

xgettext.pl -P perl=* -P tt2=* --output=lib/Tanglu/I18N/messages.pot --directory=lib/ --directory=root/
