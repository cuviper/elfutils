#! /bin/sh
# Copyright (C) 2014 Red Hat, Inc.
# Copyright (C) 2016 Oracle, Inc.
# This file is part of elfutils.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# elfutils is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

. $srcdir/test-subr.sh

# = testfileppc32attrs.s =
# .gnu_attribute 8,1
# .gnu_attribute 12,1
#
# gcc -m32 -c testfileppc32attrs.s

# = testfileppc64attrs.s =
# .gnu_attribute 4,3
#
# gcc -c testfileppc64attrs.s


testfiles testfileppc32attrs.o testfileppc64attrs.o

testrun_compare ${abs_top_builddir}/src/readelf -A testfileppc32attrs.o <<\EOF

Object attributes section [ 4] '.gnu.attributes' of 18 bytes at offset 0x34:
  Owner          Size
  gnu              17
    File:           9
      GNU_Power_ABI_Vector: Generic
      GNU_Power_ABI_Struct_Return: r3/r4
EOF

testrun_compare ${abs_top_builddir}/src/readelf -A testfileppc64attrs.o <<\EOF

Object attributes section [ 4] '.gnu.attributes' of 16 bytes at offset 0x40:
  Owner          Size
  gnu              15
    File:           7
      GNU_Power_ABI_FP: Single-precision hard float
EOF

exit 0
