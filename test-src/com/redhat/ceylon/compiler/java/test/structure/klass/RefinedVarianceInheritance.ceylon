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
interface RVI_Covariant<out T> {
    shared formal T m();
}
class RVI_Covariant_Super() satisfies RVI_Covariant<Object> {
    shared actual default Object m() {
        return "super";
    }
}
class RVI_Covariant_Sub() extends RVI_Covariant_Super() satisfies RVI_Covariant<String> {
    shared actual String m() {
        return "sub";
    }
}

interface RVI_Contravariant<in T> {
    shared formal void m(T t);
}
class RVI_Contravariant_Super() satisfies RVI_Contravariant<String> {
    shared actual default void m(String t) {
        print("t: " t "");
    }
}
class RVI_Contravariant_Sub() extends RVI_Contravariant_Super() satisfies RVI_Contravariant<Object> {
}


shared void rvi_run(){ 
    RVI_Covariant<String> cov_string = RVI_Covariant_Sub();
    print(cov_string.m());
    RVI_Covariant<Object> cov_object = RVI_Covariant_Sub();
    print(cov_object.m());
    RVI_Covariant_Super cov_super = RVI_Covariant_Sub();
    print(cov_super.m());
    RVI_Covariant_Sub cov_sub = RVI_Covariant_Sub();
    print(cov_sub.m());

    RVI_Contravariant<Object> contrav_object = RVI_Contravariant_Sub();
    // FIXME: needs overloading to work
    //contrav_object.m(2);
    RVI_Contravariant<String> contrav_string = RVI_Contravariant_Sub();
    contrav_string.m("string");
    RVI_Contravariant_Super contrav_super = RVI_Contravariant_Sub();
    contrav_super.m("super");
    RVI_Contravariant_Sub contrav_sub = RVI_Contravariant_Sub();
    // FIXME: needs type checker fix to work (is limited to m(String) for now)
    //contrav_sub.m(2);
}