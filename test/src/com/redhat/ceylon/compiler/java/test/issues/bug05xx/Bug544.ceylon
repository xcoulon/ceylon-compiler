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
class Bug544(String s) {}

@nomodel
class Bug544SharedAttribute(s) extends Bug544(s) {
    shared String s;
}

@nomodel
class Bug544Captured(String s) extends Bug544(s) {
    String m(){
        return s;
    }
}

@nomodel
class Bug544NonSharedAttr(String s) extends Bug544(s) {
}

@nomodel
String s = "";

@nomodel
class Bug544Toplevel() extends Bug544(s) {
}

@nomodel
class Bug544Qualified(Bug544SharedAttribute b) extends Bug544(b.s) {
}

@nomodel
class Bug544ContainerClass() {
    
    shared String s = "";
    
    class Bug544CapturesFromOuterClass() extends Bug544(s) {
    }
}

@nomodel
interface Bug544ContainerInterface {
    
    shared formal String s;
    
    class Bug544CapturesFromOuterInterface() extends Bug544(s) {
    }
}
