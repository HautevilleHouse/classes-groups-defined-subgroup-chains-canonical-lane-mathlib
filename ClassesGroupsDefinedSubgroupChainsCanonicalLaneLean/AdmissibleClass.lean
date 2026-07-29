import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

structure AdmissibleClass where
  object : SubgroupChainAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SubgroupChainWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse