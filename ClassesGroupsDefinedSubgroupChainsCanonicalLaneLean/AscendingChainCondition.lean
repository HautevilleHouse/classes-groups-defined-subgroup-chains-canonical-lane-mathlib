import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainStructure

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure AscendingChainCondition (S : SubgroupChainStructure) where
  chainStabilizes : ∀ (seq : ℕ → S.indexType), (∀ n : ℕ, S.chainIndex seq n seq (n+1)) → ∃ N : ℕ, ∀ m : ℕ, m ≥ N → seq m = seq N

structure AscendingChainConditionEvidence (S : SubgroupChainStructure) (A : AscendingChainCondition S) where
  chainStabilizesClosed : A.chainStabilizes
  stabilizesAsSubgroup : ∀ (seq : ℕ → S.indexType), (∀ n : ℕ, S.chainIndex seq n seq (n+1)) → ∃ N : ℕ, ∀ m : ℕ, m ≥ N → S.subgroupAt (seq m) = S.subgroupAt (seq N)

def AscendingChainConditionClosed (S : SubgroupChainStructure) (A : AscendingChainCondition S) : Prop :=
  A.chainStabilizes ∧ (∀ (seq : ℕ → S.indexType), (∀ n : ℕ, S.chainIndex seq n seq (n+1)) → ∃ N : ℕ, ∀ m : ℕ, m ≥ N → S.subgroupAt (seq m) = S.subgroupAt (seq N))

theorem acc_closed_from_evidence (S : SubgroupChainStructure) (A : AscendingChainCondition S)
    (E : AscendingChainConditionEvidence S A) : AscendingChainConditionClosed S A := by
  exact And.intro E.chainStabilizesClosed E.stabilizesAsSubgroup

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse