Require Import Le Lt Gt Decidable Arith.
Require Import NatIntf.
Require Import Cpdt.CpdtTactics.

Local Open Scope nat_scope.

(* A canonical implementation of NatInterface using a unary representation
 * of the natural numbers. *)
Module CanonicalNat <: NatInterface.
  Definition N := nat.
  Definition zero := 0.
  Definition succ := S.
  Definition pred := pred.
  Definition add := plus.
  Definition sub := minus.

  Fixpoint comp (n n' : nat) : comparison :=
    match n, n' with
    | 0, S _ => Lt
    | 0, 0 => Eq
    | S _, 0 => Gt
    | S m, S m' => comp m m'
    end.
End CanonicalNat.


Lemma comp_eq : forall n n', CanonicalNat.comp n n' = Eq <-> n = n'.
  intros n.
  induction n.
    intros n'; destruct n'; crush.
    intros n'.
    destruct n'.
      crush.
      rewrite (IHn n').
      crush.
Defined.

Lemma comp_lt : forall n n', CanonicalNat.comp n n' = Lt <-> n < n'.
  intros n.
  induction n.
    intros n'; destruct n'; crush.
    intros n'.
    destruct n'.
      crush.
      rewrite (IHn n').
      crush.
Defined.

Lemma comp_gt : forall n n', CanonicalNat.comp n n' = Gt <-> n > n'.
  intros n.
  induction n.
    intros n'; destruct n'; crush.
    intros n'.
    destruct n'.
      crush.
      rewrite (IHn n').
      crush.
Defined.
