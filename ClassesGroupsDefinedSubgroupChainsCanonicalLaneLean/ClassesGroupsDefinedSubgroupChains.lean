import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure DefinedSubgroupChain (G : Type u) [Group G] where
  chain : List (Subgroup G)
  chainStartsWithTrivial : chain.head? = some ⊥
  chainEndsWith : chain.getLast? = some ⊤
  chainIsAscending : ∀ i, i < chain.length - 1 → chain.get? i ≤ chain.get? (i+1)
  strictAtDefinedIndices : List ℕ
  strictAtDefinedIndicesProperty : ∀ i ∈ strictAtDefinedIndices, 
    i < chain.length - 1 → chain.get? i < chain.get? (i+1)

structure ChainAdmissibleEvidence (G : Type u) [Group G] (C : DefinedSubgroupChain G) where
  chainStartsWithTrivialClosed : C.chainStartsWithTrivial
  chainEndsWithClosed : C.chainEndsWith
  chainIsAscendingClosed : C.chainIsAscending
  strictAtDefinedIndicesClosed : C.strictAtDefinedIndicesProperty

def ChainAdmissible (G : Type u) [Group G] (C : DefinedSubgroupChain G) : Prop :=
  C.chainStartsWithTrivial ∧ C.chainEndsWith ∧ C.chainIsAscending ∧ C.strictAtDefinedIndicesProperty

theorem chain_admissible_from_evidence (G : Type u) [Group G] (C : DefinedSubgroupChain G) 
    (E : ChainAdmissibleEvidence G C) : ChainAdmissible G C := by
  exact And.intro E.chainStartsWithTrivialClosed
    (And.intro E.chainEndsWithClosed
      (And.intro E.chainIsAscendingClosed E.strictAtDefinedIndicesClosed))

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse
