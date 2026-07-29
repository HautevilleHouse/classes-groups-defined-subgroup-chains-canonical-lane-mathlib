import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.SubgroupChainDefinitions

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure GroupClassificationPackage (G : Type u) [Group G] where
  group : Type u
  groupStructure : Group group
  chain : SubgroupChain group
  classificationCondition : Prop
  classificationWitness : classificationCondition

def GroupClassificationClosed (G : Type u) [Group G] (P : GroupClassificationPackage G) : Prop :=
  P.classificationCondition

theorem group_classification_closed_from_package (G : Type u) [Group G] (P : GroupClassificationPackage G) : GroupClassificationClosed G P := by
  exact P.classificationWitness

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse