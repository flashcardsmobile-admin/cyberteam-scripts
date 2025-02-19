#!/bin/sh

# A collection of one-line programs that can be selected by the first argument.

case "$1" in
    get_epoch)
        exec perl -le "print time"
        ;;
    epoch_to_date)
        exec perl -le "print scalar gmtime $2"
        ;;
    get_date)
        exec perl -le "print scalar gmtime time"
        ;;
    to_dec)
        exec perl -le "print $2"
        ;;
    to_hex)
        exec perl -le "printf \"0x%x\\n\", $2"
        ;;
    bin_to_01)
        exec perl -l -0777 -ne 'print unpack("B*", $_)' "$2"
        ;;
    bin_to_hex)
        exec perl -l -0777 -ne 'print unpack("H*", $_)' "$2"
        ;;
    check_endian)
        exec perl -le "print((ord pack 's', 1) ? 'little' : 'big', '-endian')"
        ;;
    perl)
        exec perl -ne 'eval; print "$@\n> "'
        ;;
    chars)
        exec perl -lne "chomp; print tr///c"
        ;;
    untabify)
        exec perl -MText::Tabs -ne '$tabstop=8; print expand($_)'
        ;;
esac

echo "Please name the one-liner to run."
exit 1
