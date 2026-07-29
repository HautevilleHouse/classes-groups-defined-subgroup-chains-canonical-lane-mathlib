import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure GroupClassChainPackage where
  underlyingGroup : Type u
  groupOperation : underlyingGroup → underlyingGroup → underlyingGroup
  identityElement : underlyingGroup
  inverseOperation : underlyingGroup → underlyingGroup
  groupAxioms : Prop
  subgroupChain : Nat → Set underlyingGroup
  chainStabilizes : Prop
  chainLengthFinite : Prop

structure GroupClassChainEvidence (P : GroupClassChainPackage) where
  groupAxiomsClosed : P.groupAxioms
  chainStabilizesClosed : P.chainStabilizes
  chainLengthFiniteClosed : P.chainLengthFinite

def GroupClassChainClosed (P : GroupClassChainPackage) : Prop :=
  P.groupAxioms ∧ P.chainStabilizes ∧ P.chainLengthFinite

theorem group_class_chain_closed_from_evidence (P : GroupClassChainPackage)
    (E : GroupClassChainEvidence P) : GroupClassChainClosed P := by
  exact And.intro E.groupAxiomsClosed
    (And.intro E.chainStabilizesClosed E.chainLengthFiniteClosed)

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse