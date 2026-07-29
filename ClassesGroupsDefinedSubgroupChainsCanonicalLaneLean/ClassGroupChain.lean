import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure ClassGroup (R : Type) [CommRing R] where
  idealClassGroup : Type u
  groupStructure : Group idealClassGroup
  classNumber : ℕ

structure ClassGroupChainPackage (R : Type) [CommRing R] where
  classGroup : ClassGroup R
  chain : SubgroupChain (classGroup.idealClassGroup)
  chainCapturesClassGroup : Prop
  ramificationCondition : Prop

structure ClassGroupChainEvidence {R : Type} [CommRing R] (P : ClassGroupChainPackage R) where
  chainCapturesClassGroupClosed : P.chainCapturesClassGroup
  ramificationConditionClosed : P.ramificationCondition

def ClassGroupChainClosed {R : Type} [CommRing R] (P : ClassGroupChainPackage R) : Prop :=
  P.chainCapturesClassGroup ∧ P.ramificationCondition

theorem class_group_chain_closed_from_evidence {R : Type} [CommRing R]
    (P : ClassGroupChainPackage R) (E : ClassGroupChainEvidence P) : ClassGroupChainClosed P := by
  exact And.intro E.chainCapturesClassGroupClosed E.ramificationConditionClosed

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse