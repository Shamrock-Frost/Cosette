import .u_semiring
import .extra_constants
/- lemmas used in congruence of u-semirings -/

section
variables {s: Schema} {t₁ t₂ t₃ t₄: Tuple s} {a b c d e f: usr} {R: Tuple s → usr}
private meta def simp_solve :=
    `[intros h, rewrite ← h, try {simp <|> ac_refl}]

lemma ueq_symm: a = b → b = a := 
begin
    intros, rewrite a_1, 
end

lemma ueq_trans_1 : 
(t₁ ≃ t₂) * ((t₂ ≃ t₃) * c) * ((t₁ ≃ t₃) * d) * f = e → (t₁ ≃ t₂) * ((t₂ ≃ t₃) * c) * d * f = e := 
begin
    intros h,
    rewrite ← h,
    simp,
end

lemma ueq_trans_1' : 
(t₁ ≃ t₂) * (t₂ ≃ t₃) * ((t₁ ≃ t₃) * d) * f = e → (t₁ ≃ t₂) * (t₂ ≃ t₃) * d * f = e := by simp_solve

lemma ueq_trans_2_g : 
(t₁ ≃ t₂) * ((t₁ ≃ t₃) * c) * ((t₂ ≃ t₃) * d) * f = e → (t₁ ≃ t₂) * ((t₁ ≃ t₃) * c) * d * f = e := by simp_solve

lemma ueq_trans_2_g' : 
(t₁ ≃ t₂) * (t₁ ≃ t₃) * ((t₂ ≃ t₃) * d) * f = e → (t₁ ≃ t₂) * (t₁ ≃ t₃) * d * f = e := by simp_solve

lemma ueq_trans_2_l :
(t₁ ≃ t₂) * ((t₁ ≃ t₃) * c) * ((t₃  ≃ t₂) * d) * f = e → (t₁ ≃ t₂) * ((t₁ ≃ t₃) * c) * d * f = e := by simp_solve

lemma ueq_trans_2_l' :
(t₁ ≃ t₂) * (t₁ ≃ t₃) * ((t₃  ≃ t₂) * d) * f = e → (t₁ ≃ t₂) * (t₁ ≃ t₃) * d * f = e := by simp_solve

lemma ueq_trans_3_g :  
(t₁ ≃ t₂) * ((t₃ ≃ t₂) * c) * ((t₁ ≃ t₃) * d) * f = e → (t₁ ≃ t₂) * ((t₃ ≃ t₂) * c) * d * f = e := by simp_solve

lemma ueq_trans_3_g' :  
(t₁ ≃ t₂) * (t₃ ≃ t₂) * ((t₁ ≃ t₃) * d) * f = e → (t₁ ≃ t₂) * (t₃ ≃ t₂) * d * f = e := by simp_solve

lemma ueq_trans_3_l :
(t₁ ≃ t₂) * ((t₃ ≃ t₂) * c) * ((t₃ ≃ t₁) * d) * f = e → (t₁ ≃ t₂) * ((t₃ ≃ t₂) * c) * d * f = e := by simp_solve

lemma ueq_trans_3_l' :
(t₁ ≃ t₂) * (t₃ ≃ t₂) * ((t₃  ≃ t₁) * d) * f = e → (t₁ ≃ t₂) * (t₃ ≃ t₂) * d * f = e := by simp_solve

lemma ueq_trans_4 :
(t₁ ≃ t₂) * ((t₃ ≃ t₁) * c) * ((t₃ ≃ t₂) * d) * f = e → (t₁ ≃ t₂) * ((t₃ ≃ t₁) * c) * d * f = e := by simp_solve

lemma ueq_trans_4' :
(t₁ ≃ t₂) * (t₃ ≃ t₁) * ((t₃ ≃ t₂) * d) * f = e → (t₁ ≃ t₂) * (t₃ ≃ t₁) * d * f = e := by simp_solve

lemma prod_symm_assoc :
a * (b * c) = b * (a * c) := by ac_refl 

lemma time_one' :
1 * a = a := by simp

-- change the goal to the form  a x 1 = b x 1
lemma add_unit:
a * 1 = b * 1 → a = b :=
begin
    simp,
    intros, 
    assumption,
end

lemma add_unit_m:
a * 1 * b = c * 1 * d → a * b = c * d :=
begin
    simp,
    intros,
    assumption,
end

lemma add_unit_l:
1 * a = 1 * b → a = b :=
begin
    simp,
    intros,
    assumption,
end

lemma ueq_left_assoc_lem :
a * (t₁ ≃ t₂) * b = c → a * ((t₁ ≃ t₂) * b) = c := by simp_solve

-- TODO: revisit if squash involved
lemma ueq_right_assoc_lem {s₁ s₂: Schema} {t₁ t₂: Tuple s₁} {t₃ t₄: Tuple s₂}:
a * ((t₁ ≃ t₂) * (t₃ ≃ t₄)) * d = e → 
a * (t₁ ≃ t₂) * (t₃ ≃ t₄) * d = e := by simp_solve

lemma ueq_right_assoc_lem' {s₁ s₂: Schema} {t₁ t₂: Tuple s₁} {t₃ t₄: Tuple s₂}:
a * ((t₁ ≃ t₂) * ((t₃ ≃ t₄) * c)) * d = e → a * (t₁ ≃ t₂) * ((t₃ ≃ t₄) * c) * d = e  := by simp_solve

lemma move_ueq_between_com :
((t₁ ≃ t₂) * a) * b * c = d → a * ((t₁ ≃ t₂) * b) * c = d := by simp_solve

--TODO: this requires a good unification
lemma ueq_subst_in_spnf :
(t₁ ≃ t₂) * a * b * (R t₁) = (t₁ ≃ t₂) * a * b * (R t₂) := by simp

lemma ueq_subst_in_spnf' :
(t₁ ≃ t₂) * a * (R t₁) = (t₁ ≃ t₂) * a * (R t₂) := by simp

lemma ueq_dedup :
(t₁ ≃ t₂) * (t₁ ≃ t₂) = (t₁ ≃ t₂) := by simp

lemma ueq_dedup' :
(t₁ ≃ t₂) * ((t₁ ≃ t₂) * a) = (t₁ ≃ t₂) * a := by simp

lemma pred_cancel' {p: Pred s} {t: Tuple s} {a: usr}:
(denotePred p t) * ((denotePred p t) * a) =
(denotePred p t) * a :=
begin
    rewrite ← time_assoc,
    rewrite pred_cancel,
end 

end -- end section
