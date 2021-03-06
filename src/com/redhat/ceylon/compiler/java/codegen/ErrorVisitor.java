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
package com.redhat.ceylon.compiler.java.codegen;

import com.redhat.ceylon.compiler.Util;
import com.redhat.ceylon.compiler.typechecker.analyzer.AnalysisWarning;
import com.redhat.ceylon.compiler.typechecker.analyzer.UsageWarning;
import com.redhat.ceylon.compiler.typechecker.tree.Message;
import com.redhat.ceylon.compiler.typechecker.tree.NaturalVisitor;
import com.redhat.ceylon.compiler.typechecker.tree.Node;
import com.redhat.ceylon.compiler.typechecker.tree.Visitor;
import com.sun.tools.javac.util.Context;

public class ErrorVisitor extends Visitor implements NaturalVisitor {

    private boolean allowWarnings;

    public ErrorVisitor(Context context) {
        super();
        this.allowWarnings = Util.allowWarnings(context);
    }

    public boolean hasErrors(Node target) {
        try{
            visitAny(target);
            return false;
        }catch(HasErrorException x){
            return true;
        }
    }

    @Override
    public void handleException(Exception e, Node that) {
        // rethrow
        throw (RuntimeException)e;
    }
    
    @Override
    public void visitAny(Node that) {
        // fast termination
        if(hasError(that))
            throw new HasErrorException();
        super.visitAny(that);
    }

    private boolean hasError(Node that) {
        if (allowWarnings) {
            // skip warnings
            for(Message message : that.getErrors()){
                if(!(message instanceof AnalysisWarning)
                        && !(message instanceof UsageWarning))
                    return true;
            }
        } else {
            // skip only usage warnings
            for(Message message : that.getErrors()){
                if(!(message instanceof UsageWarning))
                    return true;
            }
        }
        return false;
    }
}