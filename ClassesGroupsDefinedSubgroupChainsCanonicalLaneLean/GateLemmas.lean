import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end ClassesGroupsDefinedSubgroupChainsCanonicalLaneLean
end HautevilleHouse
