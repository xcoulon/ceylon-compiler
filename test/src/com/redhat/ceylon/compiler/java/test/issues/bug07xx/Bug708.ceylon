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
T|String? bug708<T>() { return null; }
@nomodel
class Bug708<T>() { 
    shared T|String? test() { return null; }
}
@nomodel
String? bug708extra1 = bug708<String>();
@nomodel
String? bug708extra2 = Bug708<String>().test();
@nomodel
Bug708<String>? bug708obj = Bug708<String>();
@nomodel
String? bug708extra3 = bug708obj?.test();
@nomodel
Bug708<String>[] bug708seq = { Bug708<String>() };
@nomodel
String?[] bug708extra4 = bug708seq[].test();
@nomodel
void bug708_test() {
    if (exists s = bug708<String>()) {}
}

class Bug708_Class<T>(T|String? param, param2) {
    shared T|String? attr = param;
    shared T|String? param2;
    shared T|String? getter {
        return param;
    }
    if (exists s = Bug708_Class<String>("","").param) {}
    if (exists s = Bug708_Class<String>("","").param2) {}
    if (exists s = Bug708_Class<String>("","").attr) {}
    if (exists s = Bug708_Class<String>("","").getter) {}
}