/*
 * Copyright Red Hat Inc. and/or its affiliates and other contributors
 * as indicated by the authors tag. All rights reserved.
 *
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions
 * of the GNU General Public License version 2.
 * 
 * This particular file is subject to the "Classpath" exception as provided in the 
 * LICENSE file that accompanied this code.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT A
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License,
 * along with this distribution; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 */

@nomodel
interface Bug639Widening {
    shared formal Object? implementation;
}
@nomodel
class Bug639WideningImpl(String impl) satisfies Bug639Widening {
    shared actual String implementation = impl;
    shared Integer length {
        return implementation.size;
    }
}
@nomodel
class Bug639WideningImpl2(Integer impl) satisfies Bug639Widening {
    shared actual Integer implementation = impl;
    shared void neg(Bug639Widening w) {
        if (is Bug639WideningImpl2 w) {
            Number a = implementation.negativeValue;
            Number b = w.implementation.negativeValue;
        }
    }
}
