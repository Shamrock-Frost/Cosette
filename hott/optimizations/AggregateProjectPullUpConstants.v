Require Import HoTT. 
Require Import UnivalenceAxiom. 
Require Import HoTTEx. 
Require Import Denotation. 
Require Import UnivalentSemantics. 
Require Import AutoTactics. 
Require Import CQTactics. 
 
Open Scope type. 
 
Module Optimization (T : Types) (S : Schemas T) (R : Relations T S)  (A : Aggregators T S). 
  Import T S R A. 
  Module SQL_TSRA := SQL T S R A. 
  Import SQL_TSRA. 
  Module AutoTac := AutoTactics T S R A. 
  Import AutoTac. 
  Module CQTac := CQTactics T S R A. 
  Import CQTac. 
 
  Notation combine' := combineGroupByProj.
 
  Parameter count : forall {T}, aggregator T int. 
  Notation "'COUNT' ( e )" := (aggregatorGroupByProj count e). 
  Parameter sum : forall {T}, aggregator T int. 
  Notation "'SUM' ( e )" := (aggregatorGroupByProj sum e). 
  Parameter max : forall {T}, aggregator T int. 
  Notation "'MAX' ( e )" := (aggregatorGroupByProj max e). 
  Parameter min : forall {T}, aggregator T int. 
  Notation "'MIN' ( e )" := (aggregatorGroupByProj min e). 
  Parameter avg : forall {T}, aggregator T int. 
  Notation "'AVG' ( e )" := (aggregatorGroupByProj avg e).
 
  Parameter gt: Pred (node (leaf int) (leaf int)). 
 
  Variable integer_10: constant int. 


  Definition Rule: Type. 
    refine (forall ( Γ scm_emp: Schema) (rel_emp: relation scm_emp) (emp_empno : Column int scm_emp) (emp_ename : Column int scm_emp) (emp_job : Column int scm_emp) (emp_mgr : Column int scm_emp) (emp_hiredate : Column int scm_emp) (emp_comm : Column int scm_emp) (emp_sal : Column int scm_emp) (emp_deptno : Column int scm_emp) (emp_slacker : Column int scm_emp), _). 
    refine (⟦ Γ ⊢ (SELECT  (combine' PLAIN(variable (right⋅emp_job)) (combine' PLAIN(variable (right⋅emp_empno)) (combine' PLAIN(variable (right⋅emp_sal)) (SUM(variable (right⋅emp_sal)))))) FROM1  (table rel_emp) WHERE (equal (variable (right⋅emp_empno)) (constantExpr integer_10)) GROUP BY  (combine (right⋅emp_job) (combine (right⋅emp_empno) (right⋅emp_sal)))) : _ ⟧ =  ⟦ Γ ⊢ (SELECT  (combine' PLAIN(variable (right⋅emp_job)) (combine' PLAIN(variable (e2p (constantExpr integer_10))) (combine' PLAIN(variable (right⋅emp_sal)) (SUM(variable (right⋅emp_sal)))))) FROM1  (table rel_emp) WHERE (equal (variable (right⋅emp_empno)) (constantExpr integer_10)) GROUP BY  (combine (right⋅emp_job) (right⋅emp_sal))) : _ ⟧). 
  Defined. 
  Arguments Rule /. 
 
  Lemma ruleStand: Rule. 
    start.
    f_ap.
    destruct t as [a [b [c d]]].
    f_ap.
    by_extensionality t.
    repeat rewrite <- (path_universe_uncurried (equiv_path_prod _ _)).
    simpl.
    rewrite (path_universe_uncurried (equiv_prod_symm _ _)).
    symmetry.
    rewrite (path_universe_uncurried (equiv_prod_symm _ _)).
    repeat rewrite (path_universe_uncurried (equiv_prod_assoc _ _ _)).
    f_ap.
    rewrite (path_universe_uncurried (equiv_prod_symm _ _)).
    symmetry.
    rewrite (path_universe_uncurried (equiv_prod_symm _ _)).
    repeat rewrite (path_universe_uncurried (equiv_prod_assoc _ _ _)).
    f_ap.
    + apply path_universe_uncurried.
      apply equiv_iff_hprop_uncurried.
      constructor; break_and_rewrite.
    + f_ap.
      f_ap.
      by_extensionality t'.
      f_ap.
      by_extensionality t0.
      repeat rewrite (path_universe_uncurried (equiv_prod_assoc _ _ _)).
      rewrite (path_universe_uncurried (equiv_prod_symm _ _)).
      symmetry.
      rewrite (path_universe_uncurried (equiv_prod_symm _ _)).
      repeat rewrite (path_universe_uncurried (equiv_prod_assoc _ _ _)).
      f_ap.
      apply path_universe_uncurried.
      apply equiv_iff_hprop_uncurried.
      constructor; break_and_rewrite.
      Admitted.  
 
End Optimization. 
